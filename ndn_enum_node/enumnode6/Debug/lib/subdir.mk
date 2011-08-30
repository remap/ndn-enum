################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../lib/basicparsetest.o \
../lib/ccn_bloom.o \
../lib/ccn_buf_decoder.o \
../lib/ccn_buf_encoder.o \
../lib/ccn_bulkdata.o \
../lib/ccn_charbuf.o \
../lib/ccn_client.o \
../lib/ccn_coding.o \
../lib/ccn_digest.o \
../lib/ccn_dtag_table.o \
../lib/ccn_extend_dict.o \
../lib/ccn_face_mgmt.o \
../lib/ccn_fetch.o \
../lib/ccn_header.o \
../lib/ccn_indexbuf.o \
../lib/ccn_interest.o \
../lib/ccn_keystore.o \
../lib/ccn_match.o \
../lib/ccn_matrix.o \
../lib/ccn_merkle_path_asn1.o \
../lib/ccn_name_util.o \
../lib/ccn_reg_mgmt.o \
../lib/ccn_schedule.o \
../lib/ccn_seqwriter.o \
../lib/ccn_setup_sockaddr_un.o \
../lib/ccn_signing.o \
../lib/ccn_sockaddrutil.o \
../lib/ccn_sockcreate.o \
../lib/ccn_traverse.o \
../lib/ccn_uri.o \
../lib/ccn_versioning.o \
../lib/encodedecodetest.o \
../lib/hashtb.o \
../lib/hashtbtest.o \
../lib/matrixtest.o \
../lib/signbenchtest.o \
../lib/skel_decode_test.o \
../lib/smoketestclientlib.o 

C_SRCS += \
../lib/ccn_bloom.c \
../lib/ccn_buf_decoder.c \
../lib/ccn_buf_encoder.c \
../lib/ccn_bulkdata.c \
../lib/ccn_charbuf.c \
../lib/ccn_client.c \
../lib/ccn_coding.c \
../lib/ccn_digest.c \
../lib/ccn_dtag_table.c \
../lib/ccn_extend_dict.c \
../lib/ccn_face_mgmt.c \
../lib/ccn_fetch.c \
../lib/ccn_header.c \
../lib/ccn_indexbuf.c \
../lib/ccn_interest.c \
../lib/ccn_keystore.c \
../lib/ccn_match.c \
../lib/ccn_matrix.c \
../lib/ccn_merkle_path_asn1.c \
../lib/ccn_name_util.c \
../lib/ccn_reg_mgmt.c \
../lib/ccn_schedule.c \
../lib/ccn_seqwriter.c \
../lib/ccn_setup_sockaddr_un.c \
../lib/ccn_signing.c \
../lib/ccn_sockaddrutil.c \
../lib/ccn_sockcreate.c \
../lib/ccn_traverse.c \
../lib/ccn_uri.c \
../lib/ccn_versioning.c \
../lib/hashtb.c 

OBJS += \
./lib/ccn_bloom.o \
./lib/ccn_buf_decoder.o \
./lib/ccn_buf_encoder.o \
./lib/ccn_bulkdata.o \
./lib/ccn_charbuf.o \
./lib/ccn_client.o \
./lib/ccn_coding.o \
./lib/ccn_digest.o \
./lib/ccn_dtag_table.o \
./lib/ccn_extend_dict.o \
./lib/ccn_face_mgmt.o \
./lib/ccn_fetch.o \
./lib/ccn_header.o \
./lib/ccn_indexbuf.o \
./lib/ccn_interest.o \
./lib/ccn_keystore.o \
./lib/ccn_match.o \
./lib/ccn_matrix.o \
./lib/ccn_merkle_path_asn1.o \
./lib/ccn_name_util.o \
./lib/ccn_reg_mgmt.o \
./lib/ccn_schedule.o \
./lib/ccn_seqwriter.o \
./lib/ccn_setup_sockaddr_un.o \
./lib/ccn_signing.o \
./lib/ccn_sockaddrutil.o \
./lib/ccn_sockcreate.o \
./lib/ccn_traverse.o \
./lib/ccn_uri.o \
./lib/ccn_versioning.o \
./lib/hashtb.o 

C_DEPS += \
./lib/ccn_bloom.d \
./lib/ccn_buf_decoder.d \
./lib/ccn_buf_encoder.d \
./lib/ccn_bulkdata.d \
./lib/ccn_charbuf.d \
./lib/ccn_client.d \
./lib/ccn_coding.d \
./lib/ccn_digest.d \
./lib/ccn_dtag_table.d \
./lib/ccn_extend_dict.d \
./lib/ccn_face_mgmt.d \
./lib/ccn_fetch.d \
./lib/ccn_header.d \
./lib/ccn_indexbuf.d \
./lib/ccn_interest.d \
./lib/ccn_keystore.d \
./lib/ccn_match.d \
./lib/ccn_matrix.d \
./lib/ccn_merkle_path_asn1.d \
./lib/ccn_name_util.d \
./lib/ccn_reg_mgmt.d \
./lib/ccn_schedule.d \
./lib/ccn_seqwriter.d \
./lib/ccn_setup_sockaddr_un.d \
./lib/ccn_signing.d \
./lib/ccn_sockaddrutil.d \
./lib/ccn_sockcreate.d \
./lib/ccn_traverse.d \
./lib/ccn_uri.d \
./lib/ccn_versioning.d \
./lib/hashtb.d 


# Each subdirectory must supply rules for building sources it contributes
lib/%.o: ../lib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


