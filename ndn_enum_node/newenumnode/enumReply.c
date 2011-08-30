/*
 * enumReply.c
 *
 *This file is used for devices/file systems to respond to
 * enumeration interest sent by enumeration applications.
 * When request name prefixes match this name, or if this device/file directory
 * knows the names under the requested name prefixes,
 * it sends back a list of their known / their application-specific / manufacturer
 * burned-in names in response to discovery and enumeration application.
 *
 * Reference: ccnput.c
 *
 *  Created on: Jul 20, 2011
 *      Author: nesl
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ccn/ccn.h>
#include <ccn/uri.h>
#include <ccn/keystore.h>
#include <ccn/signing.h>

//#define URI "/ndn/app/files/001/002/003/004/005/006/007/008/009/010/011/012/013/014/015/016/017/018/019/020/021/022/023/024/025/026/027/028/029/030/031/032/033/034/035/036/037/038/039/040/041/042/043/044/045/046/047/048/049/050/051/052/053/054/055/056/057/058/059/060/061/062/063/064/065/066/067/068/069/070/071/072/073/074/075/076/077/078/079/080/081/082/083/084/085/086/087/088/089/090/091/092/093/094/095/096/097/098/099/100"
//#define URI "/ndn/app/files/001"
#define URI "/ndn/app/files/001/002"
#define CONTENTDATA "[Content] enumnode :: /ndn/app/files/1/2/3/4/5/6/7/8/9/10"

// handling incoming interest when it is incoming / received
static enum ccn_upcall_res incoming_interest (
		struct ccn_closure *selfp,
		enum ccn_upcall_kind kind,
		struct ccn_upcall_info *info)
{
	struct ccn_charbuf *cob = selfp -> data;
	int res;

	switch (kind) {
	case CCN_UPCALL_FINAL:              // handler is about to be deregistered
		printf("deregistering handler...\n");
		return CCN_UPCALL_RESULT_OK;

	case CCN_UPCALL_INTEREST:           // incoming interest; cob is content, info is incoming interest
		if (ccn_content_matches_interest(cob -> buf, cob -> length, 1, NULL, info -> interest_ccnb, info -> pi -> offset[CCN_PI_E], info -> pi)) {

			printf("*****************%d\n", info->pi->offset[CCN_PI_B_Exclude]);
			printf("*****************%d\n", info->pi->offset[CCN_PI_E_Exclude]);
			// calculate delta new names it has

			// wait delta time

			// send data using ccn_put
			res = ccn_put(info->h, cob->buf, cob->length);
			printf("*****************%d\n");

			if (res >= 0) {
				selfp -> intdata = 1;
				ccn_set_run_timeout(info->h, 0);
				return (CCN_UPCALL_RESULT_INTEREST_CONSUMED);
			}
		}
		break;

	//case CCN_UPCALL_CONSUMED_INTEREST:  // incoming interest, someone has answered
	//case CCN_UPCALL_CONTENT:            // incoming verified content
	//case CCN_UPCALL_INTEREST_TIMED_OUT:  // interest timed out
	//case CCN_UPCALL_CONTENT_UNVERIFIED:  // content that has not been verified
	//case CCN_UPCALL_CONTENT_BAD:         // verification failed

	default:
		printf("Unexpected response.\n");
		return CCN_UPCALL_RESULT_ERR;
	}
	return (CCN_UPCALL_RESULT_OK);
}

int main(void) {
	int res;
	struct ccn *ccn= NULL;
	struct ccn_charbuf *name = NULL;
	struct ccn_charbuf *result = NULL;
	struct ccn_closure in_interest = {.p=&incoming_interest};
	struct ccn_signing_params sp = CCN_SIGNING_PARAMS_INIT; // Parameters for creating signed content objects.
	char rawcontentbuf[1024] = "";
	size_t content_size;

	// 1. Name
	name = ccn_charbuf_create();
	res = ccn_name_from_uri(name, URI);
	if (res < 0) {
		fprintf(stderr, "bad ccn URI: %s\n", URI);
		exit(1);
	}

	// 2. ccn_create, and ccn_connect
	ccn = ccn_create();
	res = ccn_connect(ccn, NULL);
	if (res < 0) {
		fprintf(stderr, "can't connect to ccnd: %d\n", res);
		ccn_perror(ccn, "ccn_connect");
		exit(1);
	}

	// Set up a handler for interest
	ccn_set_interest_filter(ccn, name, &in_interest);


	// 4. Use ccn_sign_content to create the signed content object with composed &sp,
	// if (force) { ccn_put; } # ccn_get means send ccn binary. For normal clients, this should be a ContentObject sent in response to an Interest.
	// else { ccn_set_interest_filter; ccn_run; }

	result = ccn_charbuf_create();
	result -> length = 0;
	strcat(rawcontentbuf, CONTENTDATA);
	content_size = strlen(rawcontentbuf);
	//sp.sp_flags |= CCN_SP_FINAL_BLOCK;
	res = ccn_sign_content(ccn, result, name, &sp, rawcontentbuf, content_size);
	if (res < 0) {
		ccn_perror(ccn, "ccn_sign_content");
		exit(1);
	}

	printf("Content signed, trying to send the data...\n");
	res = ccn_put(ccn, result->buf, result->length);
	if (res < 0) {
		ccn_perror(ccn, "ccn_put");
		printf("Failed to send content object: res = %d\n", res);
		exit(1);
	}
	else
		printf("ccn_put done, content object sent.\n");

	// ccn_run serves as the event loop when timeout = -1
	res = ccn_run(ccn, -1);  // Loop here all the time until it is killed, then "Event loop..."
	printf("Event loop...\n");
	if (res < 0) {
		ccn_perror(ccn, "ccn_run");
		printf("Error: ccn_run\n");
		exit(1);
	}

	ccn_destroy(&ccn);
	ccn_charbuf_destroy(&name);
	ccn_charbuf_destroy(&result);
	ccn_charbuf_destroy(&sp.template_ccnb);
	printf("ccn handle is destroyed... \n");

	return 0;

}
















