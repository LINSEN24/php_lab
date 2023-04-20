<?php
/**
 * Summary of lab
 */
class Lab
{
    private $id;
    private $labName;
    private $labAddress;

    public function __toString(){
        return "{".
            $this->id.",".
            $this->labName.",".
            $this->labAddress
            ."}";
    }

	/**
	 * @return mixed
	 */
	public function getId() {
		return $this->id;
	}
	
	/**
	 * @param mixed $id 
	 * @return self
	 */
	public function setId($id): self {
		$this->id = $id;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getLabName() {
		return $this->labName;
	}
	
	/**
	 * @param mixed $labName 
	 * @return self
	 */
	public function setLabName($labName): self {
		$this->labName = $labName;
		return $this;
	}

	/**
	 * @return mixed
	 */
	public function getLabAddress() {
		return $this->labAddress;
	}
	
	/**
	 * @param mixed $labAddress 
	 * @return self
	 */
	public function setLabAddress($labAddress): self {
		$this->labAddress = $labAddress;
		return $this;
	}
}
?>