pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stdint_h;
with Interfaces.C.Extensions;
with System;
with infiniband_verbs_h;
with stddef_h;
with slp_h;

package ibv_message_bw_interface_h is

   SLP_SERVICE_NAME : aliased constant String := "service:message_bw" & ASCII.NUL;  --  ../ibv_message_bw_interface.h:12

   DEFAULT_SERVICE_LEVEL : constant := 0;  --  ../ibv_message_bw_interface.h:15

   SLP_SERVICE_URL_MAX_LEN : constant := 1024;  --  ../ibv_message_bw_interface.h:109
   SLP_ATTRIBUTES_MAX_LEN : constant := 1024;  --  ../ibv_message_bw_interface.h:110
   --  unsupported macro: CHECK_ASSERT(assertion) check_assert(assertion,#assertion)

   CACHE_LINE_SIZE_BYTES : constant := 64;  --  ../ibv_message_bw_interface.h:253

   type buffer_allocation_type is 
     (BUFFER_ALLOCATION_HEAP,
      BUFFER_ALLOCATION_SHARED_MEMORY);
   pragma Convention (C, buffer_allocation_type);  -- ../ibv_message_bw_interface.h:25

   type communication_path_definition is record
      source_node : aliased int;  -- ../ibv_message_bw_interface.h:31
      destination_node : aliased int;  -- ../ibv_message_bw_interface.h:33
      instance : aliased int;  -- ../ibv_message_bw_interface.h:40
      source_ib_device : Interfaces.C.Strings.chars_ptr;  -- ../ibv_message_bw_interface.h:42
      destination_ib_device : Interfaces.C.Strings.chars_ptr;  -- ../ibv_message_bw_interface.h:44
      source_port_num : aliased stdint_h.uint8_t;  -- ../ibv_message_bw_interface.h:46
      destination_port_num : aliased stdint_h.uint8_t;  -- ../ibv_message_bw_interface.h:48
      max_message_size : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:50
      num_message_buffers : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:52
      allocation_type : aliased buffer_allocation_type;  -- ../ibv_message_bw_interface.h:54
      tx_polls_for_errors : aliased Extensions.bool;  -- ../ibv_message_bw_interface.h:58
      tx_checks_memory_buffer_size : aliased Extensions.bool;  -- ../ibv_message_bw_interface.h:65
   end record;
   pragma Convention (C_Pass_By_Copy, communication_path_definition);  -- ../ibv_message_bw_interface.h:66

   --  skipped anonymous struct anon_38

   type ib_port_endpoint is record
      num_devices : aliased int;  -- ../ibv_message_bw_interface.h:72
      device_list : System.Address;  -- ../ibv_message_bw_interface.h:74
      selected_device : access infiniband_verbs_h.ibv_device;  -- ../ibv_message_bw_interface.h:76
      device_context : access infiniband_verbs_h.ibv_context;  -- ../ibv_message_bw_interface.h:78
      device_pd : access infiniband_verbs_h.ibv_pd;  -- ../ibv_message_bw_interface.h:80
      device_attributes : aliased infiniband_verbs_h.ibv_device_attr;  -- ../ibv_message_bw_interface.h:82
      port_attributes : aliased infiniband_verbs_h.ibv_port_attr;  -- ../ibv_message_bw_interface.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, ib_port_endpoint);  -- ../ibv_message_bw_interface.h:85

   --  skipped anonymous struct anon_39

   type memory_buffer_attributes is record
      size : aliased stddef_h.size_t;  -- ../ibv_message_bw_interface.h:91
      addr : aliased stdint_h.uint64_t;  -- ../ibv_message_bw_interface.h:93
      rkey : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:95
      lid : aliased stdint_h.uint16_t;  -- ../ibv_message_bw_interface.h:97
      psn : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:99
      qp_num : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:101
      qp_ready_to_receive : aliased int;  -- ../ibv_message_bw_interface.h:103
   end record;
   pragma Convention (C_Pass_By_Copy, memory_buffer_attributes);  -- ../ibv_message_bw_interface.h:104

   --  skipped anonymous struct anon_40

   subtype communication_path_slp_connection_local_service_url_array is Interfaces.C.char_array (0 .. 1023);
   subtype communication_path_slp_connection_remote_service_name_array is Interfaces.C.char_array (0 .. 1023);
   subtype communication_path_slp_connection_remote_service_url_array is Interfaces.C.char_array (0 .. 1023);
   type communication_path_slp_connection is record
      handle : slp_h.SLPHandle;  -- ../ibv_message_bw_interface.h:114
      local_service_url : aliased communication_path_slp_connection_local_service_url_array;  -- ../ibv_message_bw_interface.h:116
      remote_service_name : aliased communication_path_slp_connection_remote_service_name_array;  -- ../ibv_message_bw_interface.h:120
      remote_service_url : aliased communication_path_slp_connection_remote_service_url_array;  -- ../ibv_message_bw_interface.h:123
      remote_attributes_obtained : aliased Extensions.bool;  -- ../ibv_message_bw_interface.h:125
      local_attributes : aliased memory_buffer_attributes;  -- ../ibv_message_bw_interface.h:127
      remote_attributes : aliased memory_buffer_attributes;  -- ../ibv_message_bw_interface.h:129
   end record;
   pragma Convention (C_Pass_By_Copy, communication_path_slp_connection);  -- ../ibv_message_bw_interface.h:130

   --  skipped anonymous struct anon_41

   subtype memory_buffer_pathname_array is Interfaces.C.char_array (0 .. 4095);
   type memory_buffer is record
      allocation_type : aliased buffer_allocation_type;  -- ../ibv_message_bw_interface.h:136
      size : aliased stddef_h.size_t;  -- ../ibv_message_bw_interface.h:138
      buffer : Interfaces.C.Strings.chars_ptr;  -- ../ibv_message_bw_interface.h:140
      pathname : aliased memory_buffer_pathname_array;  -- ../ibv_message_bw_interface.h:142
      fd : aliased int;  -- ../ibv_message_bw_interface.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, memory_buffer);  -- ../ibv_message_bw_interface.h:145

   --  skipped anonymous struct anon_42

   type message_header is record
      sequence_number : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:151
      message_length : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:153
      message_id : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:155
      source_instance : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, message_header);  -- ../ibv_message_bw_interface.h:158

   --  skipped anonymous struct anon_43

   --  skipped empty struct tx_message_context_s

   type tx_message_context_handle is new System.Address;  -- ../ibv_message_bw_interface.h:162

   --  skipped empty struct rx_message_context_s

   type rx_message_context_handle is new System.Address;  -- ../ibv_message_bw_interface.h:165

   type tx_api_message_buffer is record
      header : access message_header;  -- ../ibv_message_bw_interface.h:173
      data : System.Address;  -- ../ibv_message_bw_interface.h:175
      context : tx_message_context_handle;  -- ../ibv_message_bw_interface.h:177
      buffer_index : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:179
   end record;
   pragma Convention (C_Pass_By_Copy, tx_api_message_buffer);  -- ../ibv_message_bw_interface.h:180

   --  skipped anonymous struct anon_44

   type rx_api_message_buffer is record
      header : access message_header;  -- ../ibv_message_bw_interface.h:188
      data : System.Address;  -- ../ibv_message_bw_interface.h:190
      context : rx_message_context_handle;  -- ../ibv_message_bw_interface.h:192
      buffer_index : aliased stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:194
   end record;
   pragma Convention (C_Pass_By_Copy, rx_api_message_buffer);  -- ../ibv_message_bw_interface.h:195

   --  skipped anonymous struct anon_45

   --  skipped empty struct communication_context_s

   type communication_context_handle is new System.Address;  -- ../ibv_message_bw_interface.h:199

   procedure check_assert (assertion : Extensions.bool; message : Interfaces.C.Strings.chars_ptr);  -- ../ibv_message_bw_interface.h:201
   pragma Import (C, check_assert, "check_assert");

   function page_aligned_alloc (size : stddef_h.size_t) return System.Address;  -- ../ibv_message_bw_interface.h:203
   pragma Import (C, page_aligned_alloc, "page_aligned_alloc");

   function page_aligned_calloc (nmemb : stddef_h.size_t; size : stddef_h.size_t) return System.Address;  -- ../ibv_message_bw_interface.h:204
   pragma Import (C, page_aligned_calloc, "page_aligned_calloc");

   function cache_line_aligned_alloc (size : stddef_h.size_t) return System.Address;  -- ../ibv_message_bw_interface.h:205
   pragma Import (C, cache_line_aligned_alloc, "cache_line_aligned_alloc");

   function cache_line_aligned_calloc (nmemb : stddef_h.size_t; size : stddef_h.size_t) return System.Address;  -- ../ibv_message_bw_interface.h:206
   pragma Import (C, cache_line_aligned_calloc, "cache_line_aligned_calloc");

   procedure open_ib_port_endpoint
     (endpoint : access ib_port_endpoint;
      path_def : access constant communication_path_definition;
      is_tx_end : Extensions.bool);  -- ../ibv_message_bw_interface.h:207
   pragma Import (C, open_ib_port_endpoint, "open_ib_port_endpoint");

   procedure close_ib_port_endpoint (endpoint : access ib_port_endpoint);  -- ../ibv_message_bw_interface.h:209
   pragma Import (C, close_ib_port_endpoint, "close_ib_port_endpoint");

   procedure intialise_slp_connection
     (slp_connection : access communication_path_slp_connection;
      is_tx_end : Extensions.bool;
      path_def : access constant communication_path_definition);  -- ../ibv_message_bw_interface.h:210
   pragma Import (C, intialise_slp_connection, "intialise_slp_connection");

   procedure register_memory_buffer_with_slp
     (slp_connection : access communication_path_slp_connection;
      endpoint : access constant ib_port_endpoint;
      psn : stdint_h.uint32_t;
      mr : access constant infiniband_verbs_h.ibv_mr;
      qp : access constant infiniband_verbs_h.ibv_qp);  -- ../ibv_message_bw_interface.h:212
   pragma Import (C, register_memory_buffer_with_slp, "register_memory_buffer_with_slp");

   procedure report_local_memory_buffer_rtr_with_slp (slp_connection : access communication_path_slp_connection);  -- ../ibv_message_bw_interface.h:215
   pragma Import (C, report_local_memory_buffer_rtr_with_slp, "report_local_memory_buffer_rtr_with_slp");

   procedure get_remote_memory_buffer_from_slp (slp_connection : access communication_path_slp_connection);  -- ../ibv_message_bw_interface.h:216
   pragma Import (C, get_remote_memory_buffer_from_slp, "get_remote_memory_buffer_from_slp");

   procedure await_remote_memory_buffer_rtr_from_slp (slp_connection : access communication_path_slp_connection);  -- ../ibv_message_bw_interface.h:217
   pragma Import (C, await_remote_memory_buffer_rtr_from_slp, "await_remote_memory_buffer_rtr_from_slp");

   procedure close_slp_connection (slp_connection : access communication_path_slp_connection);  -- ../ibv_message_bw_interface.h:218
   pragma Import (C, close_slp_connection, "close_slp_connection");

   function align_to_cache_line_size (size : stddef_h.size_t) return stddef_h.size_t;  -- ../ibv_message_bw_interface.h:219
   pragma Import (C, align_to_cache_line_size, "align_to_cache_line_size");

   procedure create_memory_buffer
     (buffer : access memory_buffer;
      is_tx_end : Extensions.bool;
      path_def : access constant communication_path_definition);  -- ../ibv_message_bw_interface.h:220
   pragma Import (C, create_memory_buffer, "create_memory_buffer");

   procedure release_memory_buffer (buffer : access memory_buffer);  -- ../ibv_message_bw_interface.h:222
   pragma Import (C, release_memory_buffer, "release_memory_buffer");

   function get_random_psn return stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:223
   pragma Import (C, get_random_psn, "get_random_psn");

   function get_max_inline_data (qp : access infiniband_verbs_h.ibv_qp) return stdint_h.uint32_t;  -- ../ibv_message_bw_interface.h:224
   pragma Import (C, get_max_inline_data, "get_max_inline_data");

   procedure verify_qp_state
     (expected_state : infiniband_verbs_h.ibv_qp_state;
      qp : access infiniband_verbs_h.ibv_qp;
      qp_name : Interfaces.C.Strings.chars_ptr);  -- ../ibv_message_bw_interface.h:225
   pragma Import (C, verify_qp_state, "verify_qp_state");

   function message_transmit_create_local (path_def : access constant communication_path_definition) return tx_message_context_handle;  -- ../ibv_message_bw_interface.h:227
   pragma Import (C, message_transmit_create_local, "message_transmit_create_local");

   procedure message_transmit_attach_remote_pre_rtr (context : tx_message_context_handle);  -- ../ibv_message_bw_interface.h:228
   pragma Import (C, message_transmit_attach_remote_pre_rtr, "message_transmit_attach_remote_pre_rtr");

   procedure message_transmit_attach_remote_post_rtr (context : tx_message_context_handle);  -- ../ibv_message_bw_interface.h:229
   pragma Import (C, message_transmit_attach_remote_post_rtr, "message_transmit_attach_remote_post_rtr");

   procedure message_transmit_finalise (context : tx_message_context_handle);  -- ../ibv_message_bw_interface.h:230
   pragma Import (C, message_transmit_finalise, "message_transmit_finalise");

   procedure await_all_outstanding_messages_freed (context : tx_message_context_handle);  -- ../ibv_message_bw_interface.h:231
   pragma Import (C, await_all_outstanding_messages_freed, "await_all_outstanding_messages_freed");

   function get_send_buffer_no_wait (context : tx_message_context_handle) return access tx_api_message_buffer;  -- ../ibv_message_bw_interface.h:232
   pragma Import (C, get_send_buffer_no_wait, "get_send_buffer_no_wait");

   function get_send_buffer (context : tx_message_context_handle) return access tx_api_message_buffer;  -- ../ibv_message_bw_interface.h:233
   pragma Import (C, get_send_buffer, "get_send_buffer");

   procedure send_message (api_buffer : access constant tx_api_message_buffer);  -- ../ibv_message_bw_interface.h:234
   pragma Import (C, send_message, "send_message");

   function message_receive_create_local (path_def : access constant communication_path_definition) return rx_message_context_handle;  -- ../ibv_message_bw_interface.h:236
   pragma Import (C, message_receive_create_local, "message_receive_create_local");

   procedure message_receive_attach_remote_pre_rtr (context : rx_message_context_handle);  -- ../ibv_message_bw_interface.h:237
   pragma Import (C, message_receive_attach_remote_pre_rtr, "message_receive_attach_remote_pre_rtr");

   procedure message_receive_attach_remote_post_rtr (context : rx_message_context_handle);  -- ../ibv_message_bw_interface.h:238
   pragma Import (C, message_receive_attach_remote_post_rtr, "message_receive_attach_remote_post_rtr");

   procedure message_receive_finalise (context : rx_message_context_handle);  -- ../ibv_message_bw_interface.h:239
   pragma Import (C, message_receive_finalise, "message_receive_finalise");

   function poll_rx_message (context : rx_message_context_handle) return access rx_api_message_buffer;  -- ../ibv_message_bw_interface.h:240
   pragma Import (C, poll_rx_message, "poll_rx_message");

   function await_message (context : rx_message_context_handle) return access rx_api_message_buffer;  -- ../ibv_message_bw_interface.h:241
   pragma Import (C, await_message, "await_message");

   procedure free_message (api_buffer : access rx_api_message_buffer);  -- ../ibv_message_bw_interface.h:242
   pragma Import (C, free_message, "free_message");

   procedure register_path_definition (path_def : access constant communication_path_definition);  -- ../ibv_message_bw_interface.h:244
   pragma Import (C, register_path_definition, "register_path_definition");

   function communication_context_initialise (node_number : int) return communication_context_handle;  -- ../ibv_message_bw_interface.h:245
   pragma Import (C, communication_context_initialise, "communication_context_initialise");

   function get_tx_path_handle
     (context : communication_context_handle;
      destination_node : int;
      instance : int) return tx_message_context_handle;  -- ../ibv_message_bw_interface.h:246
   pragma Import (C, get_tx_path_handle, "get_tx_path_handle");

   function poll_rx_paths (context : communication_context_handle) return access rx_api_message_buffer;  -- ../ibv_message_bw_interface.h:248
   pragma Import (C, poll_rx_paths, "poll_rx_paths");

   function await_any_rx_message (context : communication_context_handle) return access rx_api_message_buffer;  -- ../ibv_message_bw_interface.h:249
   pragma Import (C, await_any_rx_message, "await_any_rx_message");

   procedure communication_context_finalise (context : communication_context_handle);  -- ../ibv_message_bw_interface.h:250
   pragma Import (C, communication_context_finalise, "communication_context_finalise");

end ibv_message_bw_interface_h;
