library StorageSlot {
    struct AddressSlot {
        address value;
    }

    struct BooleanSlot {
        bool value;
    }

    struct Bytes32Slot {
        bytes32 value;
    }

    struct Uint256Slot {
        uint256 value;
    }

    /**
     * @dev Returns an `AddressSlot` with member `value` located at `slot`.
     */
    function getAddressSlot(bytes32 slot) internal pure returns(AddressSlot storage r){
        assembly{
            r.slot := slot
        }
    }

     /**
     * @dev Returns an `BooleanSlot` with member `value` located at `slot`.
     */
    function getBooleanSlot(bytes32 slot) internal pure returns (BooleanSlot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

   /**
     * @dev Returns an `Bytes32Slot` with member `value` located at `slot`.
     */
    function getBytes32Slot(bytes32 slot) internal pure returns (Bytes32Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }

    /**
     * @dev Returns an `Uint256Slot` with member `value` located at `slot`.
     */
    function getUint256Slot(bytes32 slot) internal pure returns (Uint256Slot storage r) {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }
}

contract SSTest {
    using StorageSlot for bytes32;

    uint256 public A;
    address public B;

    function setA(uint256 a) public{
        A = a;
    }

    function setB()public{
        B = msg.sender;
    }

    function getA() public view returns(uint256){
        bytes32 slot;

        assembly{
            slot := A.slot
        }
        return slot.getUint256Slot().value;
    }


    function getB() public view returns(address){
        bytes32 slot;

        assembly{
            slot := B.slot
        }
        return slot.getAddressSlot().value;
    }


}