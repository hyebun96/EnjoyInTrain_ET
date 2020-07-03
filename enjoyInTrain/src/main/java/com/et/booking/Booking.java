package com.et.booking;

public class Booking {
	// 프로모션 정보
	private int prSeq;					// 예약코드  
	private String pmCode;				// 프로모션 상품코드
	private String pmTitle;				// 프로모션 상품명
	private String pmStartDate;			// 프로모션 예약 시작 날짜
	private String pmEndDate;			// 프로모션 예약 종료 날짜
	private int pmPrice;				// 프로모션 가격

	// 프로모션 이용 인원
	private int adult;					// 성인
	private int adult1;					// 성인
	private int child;					// 유아
	private int child1;					// 유아
	private int oldMan;					// 경로
	private int oldMan1;				// 경로
	private int prPersonnel; 			// 예약인원 get
	
	// 가는 기차 & 오는 기차
	private String trainName;
	private String trainCode;
	private String startTrainName;		// 가는 기차 이름
	private String startTrain; 			// 가는 기차코드	
	private String startTime;			// 가는 기차 시간
	private String endTrainName;		// 오는 기차 이름
	private String endTrain;			// 오는 기차코드	
	private String endTime;				// 오는 기차 시간
	private String startStation;		// 출발하는 역 @	
	private String roomGrade;			// 객실등급
	private String prStartTrainSeat;	// 출발역 좌석
	private String endStation;			// 출발하는 역 @	
	private String prEndTrainSeat;		// 도착역 좌석
	private String roomGrade1;
	private int prAddPrice;				// 객실등급에 따라 추가금액

	// 프로모션 상품
	private String product;				// 프로모션 상품
	private String productContent;		// 프로모션 상품 설명
	private String productUserCount;	// 프로모션 상품 이용인원
	
	// 예약자
	private String crewId;				// 회원 아이디
	private String crewName;			// 예약자 이름
	private String crewEmail;			// 예약자 이메일
	private String crewTel;				// 예약자 전화번호
	private String crewBirth;			// 예약자 생년월일
	private String prReservationDate;	// 예약한 날
	private int prpayment;				// 결제 유무
	private String reservationNumber;	// 예약번호
	private String prPaymentDate;		// 결제한 날
	
	public String getTrainName() {
		return trainName;
	}
	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}
	public int getPrSeq() {
		return prSeq;
	}
	public void setPrSeq(int prSeq) {
		this.prSeq = prSeq;
	}
	public String getPmCode() {
		return pmCode;
	}
	public void setPmCode(String pmCode) {
		this.pmCode = pmCode;
	}
	public String getPmTitle() {
		return pmTitle;
	}
	public void setPmTitle(String pmTitle) {
		this.pmTitle = pmTitle;
	}
	public String getPmStartDate() {
		return pmStartDate;
	}
	public void setPmStartDate(String pmStartDate) {
		this.pmStartDate = pmStartDate;
	}
	public String getPmEndDate() {
		return pmEndDate;
	}
	public void setPmEndDate(String pmEndDate) {
		this.pmEndDate = pmEndDate;
	}
	public int getPmPrice() {
		return pmPrice;
	}
	public void setPmPrice(int pmPrice) {
		this.pmPrice = pmPrice;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getAdult1() {
		return adult1;
	}
	public void setAdult1(int adult1) {
		this.adult1 = adult1;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getChild1() {
		return child1;
	}
	public void setChild1(int child1) {
		this.child1 = child1;
	}
	public int getOldMan() {
		return oldMan;
	}
	public void setOldMan(int oldMan) {
		this.oldMan = oldMan;
	}
	public int getOldMan1() {
		return oldMan1;
	}
	public void setOldMan1(int oldMan1) {
		this.oldMan1 = oldMan1;
	}
	public int getPrPersonnel() {
		return prPersonnel;
	}
	public void setPrPersonnel(int prPersonnel) {
		this.prPersonnel = prPersonnel;
	}
	public String getTrainCode() {
		return trainCode;
	}
	public void setTrainCode(String trainCode) {
		this.trainCode = trainCode;
	}
	public String getStartTrainName() {
		return startTrainName;
	}
	public void setStartTrainName(String startTrainName) {
		this.startTrainName = startTrainName;
	}
	public String getStartTrain() {
		return startTrain;
	}
	public void setStartTrain(String startTrain) {
		this.startTrain = startTrain;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTrainName() {
		return endTrainName;
	}
	public void setEndTrainName(String endTrainName) {
		this.endTrainName = endTrainName;
	}
	public String getEndTrain() {
		return endTrain;
	}
	public void setEndTrain(String endTrain) {
		this.endTrain = endTrain;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getRoomGrade() {
		return roomGrade;
	}
	public void setRoomGrade(String roomGrade) {
		this.roomGrade = roomGrade;
	}
	public String getPrStartTrainSeat() {
		return prStartTrainSeat;
	}
	public void setPrStartTrainSeat(String prStartTrainSeat) {
		this.prStartTrainSeat = prStartTrainSeat;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public String getPrEndTrainSeat() {
		return prEndTrainSeat;
	}
	public void setPrEndTrainSeat(String prEndTrainSeat) {
		this.prEndTrainSeat = prEndTrainSeat;
	}
	public String getRoomGrade1() {
		return roomGrade1;
	}
	public void setRoomGrade1(String roomGrade1) {
		this.roomGrade1 = roomGrade1;
	}
	public int getPrAddPrice() {
		return prAddPrice;
	}
	public void setPrAddPrice(int prAddPrice) {
		this.prAddPrice = prAddPrice;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductUserCount() {
		return productUserCount;
	}
	public void setProductUserCount(String productUserCount) {
		this.productUserCount = productUserCount;
	}
	public String getCrewId() {
		return crewId;
	}
	public void setCrewId(String crewId) {
		this.crewId = crewId;
	}
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public String getCrewEmail() {
		return crewEmail;
	}
	public void setCrewEmail(String crewEmail) {
		this.crewEmail = crewEmail;
	}
	public String getCrewTel() {
		return crewTel;
	}
	public void setCrewTel(String crewTel) {
		this.crewTel = crewTel;
	}
	public String getCrewBirth() {
		return crewBirth;
	}
	public void setCrewBirth(String crewBirth) {
		this.crewBirth = crewBirth;
	}
	public String getPrReservationDate() {
		return prReservationDate;
	}
	public void setPrReservationDate(String prReservationDate) {
		this.prReservationDate = prReservationDate;
	}
	public int getPrpayment() {
		return prpayment;
	}
	public void setPrpayment(int prpayment) {
		this.prpayment = prpayment;
	}
	public String getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public String getPrPaymentDate() {
		return prPaymentDate;
	}
	public void setPrPaymentDate(String prPaymentDate) {
		this.prPaymentDate = prPaymentDate;
	}
	
	
}