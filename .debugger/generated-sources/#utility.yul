{

    // string[]
    function abi_decode_available_length_t_array$_t_string_memory_ptr_$dyn_memory_ptr(offset, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_array$_t_string_memory_ptr_$dyn_memory_ptr(length))
        let dst := array

        mstore(array, length)
        dst := add(array, 0x20)

        let src := offset
        if gt(add(src, mul(length, 0x20)), end) {
            revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef()
        }
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {

            let innerOffset := calldataload(src)
            if gt(innerOffset, 0xffffffffffffffff) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
            let elementPos := add(offset, innerOffset)

            mstore(dst, abi_decode_t_string_memory_ptr(elementPos, end))
            dst := add(dst, 0x20)
            src := add(src, 0x20)
        }
    }

    function abi_decode_available_length_t_string_memory_ptr(src, length, end) -> array {
        array := allocate_memory(array_allocation_size_t_string_memory_ptr(length))
        mstore(array, length)
        let dst := add(array, 0x20)
        if gt(add(src, length), end) { revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() }
        copy_calldata_to_memory(src, dst, length)
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    // string[]
    function abi_decode_t_array$_t_string_memory_ptr_$dyn_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_array$_t_string_memory_ptr_$dyn_memory_ptr(add(offset, 0x20), length, end)
    }

    // string
    function abi_decode_t_string_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_string_memory_ptr(add(offset, 0x20), length, end)
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_string_memory_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_string_memory_ptrt_array$_t_string_memory_ptr_$dyn_memory_ptr(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 32))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value1 := abi_decode_t_array$_t_string_memory_ptr_$dyn_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_string_memory_ptrt_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0 := abi_decode_t_string_memory_ptr(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function abi_encodeUpdatedPos_t_string_memory_ptr_to_t_string_memory_ptr(value0, pos) -> updatedPos {
        updatedPos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr(value0, pos)
    }

    function abi_encode_t_address_payable_to_t_address_payable_fromStack(value, pos) {
        mstore(pos, cleanup_t_address_payable(value))
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    // string[] -> string[]
    function abi_encode_t_array$_t_string_memory_ptr_$dyn_memory_ptr_to_t_array$_t_string_memory_ptr_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
        let length := array_length_t_array$_t_string_memory_ptr_$dyn_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_array$_t_string_memory_ptr_$dyn_memory_ptr_fromStack(pos, length)
        let headStart := pos
        let tail := add(pos, mul(length, 0x20))
        let baseRef := array_dataslot_t_array$_t_string_memory_ptr_$dyn_memory_ptr(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            mstore(pos, sub(tail, headStart))
            let elementValue0 := mload(srcPtr)
            tail := abi_encodeUpdatedPos_t_string_memory_ptr_to_t_string_memory_ptr(elementValue0, tail)
            srcPtr := array_nextElement_t_array$_t_string_memory_ptr_$dyn_memory_ptr(srcPtr)
            pos := add(pos, 0x20)
        }
        pos := tail
        end := pos
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, length)
    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_packed_t_string_memory_ptr__to_t_string_memory_ptr__nonPadded_inplace_fromStack_reversed(pos , value0) -> end {

        pos := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value0,  pos)

        end := pos
    }

    function abi_encode_tuple_t_address_payable__to_t_address_payable__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_payable_to_t_address_payable_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_tuple_t_address_t_uint256_t_uint256__to_t_address_t_uint256_t_uint256__fromStack_reversed(headStart , value2, value1, value0) -> tail {
        tail := add(headStart, 96)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

    }

    function abi_encode_tuple_t_array$_t_string_memory_ptr_$dyn_memory_ptr__to_t_array$_t_string_memory_ptr_$dyn_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_array$_t_string_memory_ptr_$dyn_memory_ptr_to_t_array$_t_string_memory_ptr_$dyn_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function allocate_memory(size) -> memPtr {
        memPtr := allocate_unbounded()
        finalize_allocation(memPtr, size)
    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function array_allocation_size_t_array$_t_string_memory_ptr_$dyn_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := mul(length, 0x20)

        // add length slot
        size := add(size, 0x20)

    }

    function array_allocation_size_t_string_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error_0x41() }

        size := round_up_to_mul_of_32(length)

        // add length slot
        size := add(size, 0x20)

    }

    function array_dataslot_t_array$_t_string_memory_ptr_$dyn_memory_ptr(ptr) -> data {
        data := ptr

        data := add(ptr, 0x20)

    }

    function array_length_t_array$_t_string_memory_ptr_$dyn_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_nextElement_t_array$_t_string_memory_ptr_$dyn_memory_ptr(ptr) -> next {
        next := add(ptr, 0x20)
    }

    function array_storeLengthForEncoding_t_array$_t_string_memory_ptr_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_string_memory_ptr(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)

        // overflow, if x > (maxValue - y)
        if gt(x, sub(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, y)) { panic_error_0x11() }

        sum := add(x, y)
    }

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)

        if lt(x, y) { panic_error_0x11() }

        diff := sub(x, y)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function cleanup_t_address_payable(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function copy_calldata_to_memory(src, dst, length) {
        calldatacopy(dst, src, length)
        // clear end
        mstore(add(dst, length), 0)
    }

    function copy_memory_to_memory(src, dst, length) {
        let i := 0
        for { } lt(i, length) { i := add(i, 32) }
        {
            mstore(add(dst, i), mload(add(src, i)))
        }
        if gt(i, length)
        {
            // clear end
            mstore(add(dst, length), 0)
        }
    }

    function extract_byte_array_length(data) -> length {
        length := div(data, 2)
        let outOfPlaceEncoding := and(data, 1)
        if iszero(outOfPlaceEncoding) {
            length := and(length, 0x7f)
        }

        if eq(outOfPlaceEncoding, lt(length, 32)) {
            panic_error_0x22()
        }
    }

    function finalize_allocation(memPtr, size) {
        let newFreePtr := add(memPtr, round_up_to_mul_of_32(size))
        // protect against overflow
        if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error_0x41() }
        mstore(64, newFreePtr)
    }

    function increment_t_uint256(value) -> ret {
        value := cleanup_t_uint256(value)
        if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
        ret := add(value, 1)
    }

    function panic_error_0x01() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x01)
        revert(0, 0x24)
    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function panic_error_0x22() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x22)
        revert(0, 0x24)
    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function panic_error_0x41() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x41)
        revert(0, 0x24)
    }

    function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
        revert(0, 0)
    }

    function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
        revert(0, 0)
    }

    function revert_error_987264b3b1d58a9c7f8255e93e81c77d86d6299019c33110a076957a3e06e2ae() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

}
