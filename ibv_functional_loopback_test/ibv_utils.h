/*
 * @file ibv_utils.h
 * @date: 9 Sep 2017
 * @author Chester Gillon
 * @brief Utility functions for Infiniband tests
 */

#ifndef IBV_UTILS_H_
#define IBV_UTILS_H_

void *page_aligned_alloc (const size_t size);
void *page_aligned_calloc (const size_t nmemb, const size_t size);
void *cache_line_aligned_alloc (const size_t size);
void *cache_line_aligned_calloc (const size_t nmemb, const size_t size);
void display_ibv_device_attributes (const struct ibv_context *const device, const struct ibv_device_attr *const device_attr);
void display_ibv_port_attributes (const struct ibv_port_attr *const port_attr);
void display_qp_capabilities (struct ibv_qp *const qp, const char *qp_name);
void verify_qp_state (const enum ibv_qp_state expected_state, struct ibv_qp *const qp, const char *qp_name);
uint32_t get_random_psn (void);
void check_assert (const bool assertion, const char *message);
#define CHECK_ASSERT(assertion) check_assert(assertion,#assertion)

/** The assumed cache line size for allocating areas. Should be valid for all Sandy Bridge and Haswell processors */
#define CACHE_LINE_SIZE_BYTES 64

#endif /* IBV_UTILS_H_ */
