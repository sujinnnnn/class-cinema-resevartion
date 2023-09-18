package egov.mywork1.service;

public class MovieAdminVO {

   //as
       String mvtitle;
       String mvgrade;
       String mvpost;
       String startday;
       String lastday;
       String mvinfo;
       String mvprev;
       String mvlocation;
       String mvroom;
       String mvvolume;
       String mvschedule;
       String unq;
       String mvdate;
       int sday;
       int lday;
       int syear;
       int smonth;
       String mvseat;
       String dday;
       String mvdirector;
       String mvgenre;
       String mvvolumeunix;
       int lastDayOfMonth;
       int lmonth;

       
       String schedule1_1;
       String schedule2_1;
       String schedule3_1;
       
       String schedule1_2;
       String schedule2_2;
       String schedule3_2;
       
       String schedule1_3;
       String schedule2_3;
       String schedule3_3;
       
       String schedule1_4;
       String schedule2_4;
       String schedule3_4;
       
       String schedule1_5;
       String schedule2_5;
       String schedule3_5;
       
       String schedule1_6;
       String schedule2_6;
       String schedule3_6;
       
       String schedule1_7;
       String schedule2_7;
       String schedule3_7;
       
       
       String branch;
       
       String u1t1;
       String u1t2;
       String u1t3;
       
       String u2t1;
       String u2t2;
       String u2t3;
       
       String u3t1;
       String u3t2;
       String u3t3;
       
       String u4t1;
       String u4t2;
       String u4t3;
       
       String u5t1;
       String u5t2;
       String u5t3;
       
       String u6t1;
       String u6t2;
       String u6t3;
       
       String u7t1;
       String u7t2;
       String u7t3;
       
       
       
       String mvunixtime;
       
       String count;
       String seats;
       
       String tday;
       
       
       /** 상영중 현재페이지 */
       private int pageIndex1 = 1;
       
       /** 예정 현재페이지 */
       private int pageIndex2 = 1;

       /** 페이지갯수 */
       private int pageUnit = 5;
       
       /** firstIndex */
       private int firstIndex1 = 1;

       /** lastIndex */
       private int lastIndex1 = 10;
       
       /** firstIndex */
       private int firstIndex2 = 1;

       /** lastIndex */
       private int lastIndex2 = 10;
       
       /** recordCountPerPage */
       private int recordCountPerPage1 = 10;
       
       /** recordCountPerPage */
       private int recordCountPerPage2 = 10;
       
       /** lastPage */
       private int lastPage1 = 1;
       
       /** lastPage */
       private int lastPage2 = 1;
       
       private int pageIndex3 = 1;
       private int pageUnit3 = 10;
       private int firstIndex3 = 1;
       private int lastIndex3 = 10;
       private int recordCountPerPage3 = 10;
       private int lastPage3 = 1;
       
       
       

      public int getLastPage3() {
		return lastPage3;
	}
	public void setLastPage3(int lastPage3) {
		this.lastPage3 = lastPage3;
	}
	public int getPageIndex3() {
		return pageIndex3;
	}
	public void setPageIndex3(int pageIndex3) {
		this.pageIndex3 = pageIndex3;
	}
	public int getPageUnit3() {
		return pageUnit3;
	}
	public void setPageUnit3(int pageUnit3) {
		this.pageUnit3 = pageUnit3;
	}
	public int getFirstIndex3() {
		return firstIndex3;
	}
	public void setFirstIndex3(int firstIndex3) {
		this.firstIndex3 = firstIndex3;
	}
	public int getLastIndex3() {
		return lastIndex3;
	}
	public void setLastIndex3(int lastIndex3) {
		this.lastIndex3 = lastIndex3;
	}
	public int getRecordCountPerPage3() {
		return recordCountPerPage3;
	}
	public void setRecordCountPerPage3(int recordCountPerPage3) {
		this.recordCountPerPage3 = recordCountPerPage3;
	}
	public String getU2t1() {
         return u2t1;
      }
      public void setU2t1(String u2t1) {
         this.u2t1 = u2t1;
      }
      public String getU2t2() {
         return u2t2;
      }
      public void setU2t2(String u2t2) {
         this.u2t2 = u2t2;
      }
      public String getU2t3() {
         return u2t3;
      }
      public void setU2t3(String u2t3) {
         this.u2t3 = u2t3;
      }
      public String getU3t1() {
         return u3t1;
      }
      public void setU3t1(String u3t1) {
         this.u3t1 = u3t1;
      }
      public String getU3t2() {
         return u3t2;
      }
      public void setU3t2(String u3t2) {
         this.u3t2 = u3t2;
      }
      public String getU3t3() {
         return u3t3;
      }
      public void setU3t3(String u3t3) {
         this.u3t3 = u3t3;
      }
      public String getU4t1() {
         return u4t1;
      }
      public void setU4t1(String u4t1) {
         this.u4t1 = u4t1;
      }
      public String getU4t2() {
         return u4t2;
      }
      public void setU4t2(String u4t2) {
         this.u4t2 = u4t2;
      }
      public String getU4t3() {
         return u4t3;
      }
      public void setU4t3(String u4t3) {
         this.u4t3 = u4t3;
      }
      public String getU5t1() {
         return u5t1;
      }
      public void setU5t1(String u5t1) {
         this.u5t1 = u5t1;
      }
      public String getU5t2() {
         return u5t2;
      }
      public void setU5t2(String u5t2) {
         this.u5t2 = u5t2;
      }
      public String getU5t3() {
         return u5t3;
      }
      public void setU5t3(String u5t3) {
         this.u5t3 = u5t3;
      }
      public String getU6t1() {
         return u6t1;
      }
      public void setU6t1(String u6t1) {
         this.u6t1 = u6t1;
      }
      public String getU6t2() {
         return u6t2;
      }
      public void setU6t2(String u6t2) {
         this.u6t2 = u6t2;
      }
      public String getU6t3() {
         return u6t3;
      }
      public void setU6t3(String u6t3) {
         this.u6t3 = u6t3;
      }
      public String getU7t1() {
         return u7t1;
      }
      public void setU7t1(String u7t1) {
         this.u7t1 = u7t1;
      }
      public String getU7t2() {
         return u7t2;
      }
      public void setU7t2(String u7t2) {
         this.u7t2 = u7t2;
      }
      public String getU7t3() {
         return u7t3;
      }
      public void setU7t3(String u7t3) {
         this.u7t3 = u7t3;
      }
      public String getTday() {
         return tday;
      }
      public void setTday(String tday) {
         this.tday = tday;
      }
      public String getSchedule1_4() {
         return schedule1_4;
      }
      public void setSchedule1_4(String schedule1_4) {
         this.schedule1_4 = schedule1_4;
      }
      public String getSchedule2_4() {
         return schedule2_4;
      }
      public void setSchedule2_4(String schedule2_4) {
         this.schedule2_4 = schedule2_4;
      }
      public String getSchedule3_4() {
         return schedule3_4;
      }
      public void setSchedule3_4(String schedule3_4) {
         this.schedule3_4 = schedule3_4;
      }
      public String getSchedule1_5() {
         return schedule1_5;
      }
      public void setSchedule1_5(String schedule1_5) {
         this.schedule1_5 = schedule1_5;
      }
      public String getSchedule2_5() {
         return schedule2_5;
      }
      public void setSchedule2_5(String schedule2_5) {
         this.schedule2_5 = schedule2_5;
      }
      public String getSchedule3_5() {
         return schedule3_5;
      }
      public void setSchedule3_5(String schedule3_5) {
         this.schedule3_5 = schedule3_5;
      }
      public String getSchedule1_6() {
         return schedule1_6;
      }
      public void setSchedule1_6(String schedule1_6) {
         this.schedule1_6 = schedule1_6;
      }
      public String getSchedule2_6() {
         return schedule2_6;
      }
      public void setSchedule2_6(String schedule2_6) {
         this.schedule2_6 = schedule2_6;
      }
      public String getSchedule3_6() {
         return schedule3_6;
      }
      public void setSchedule3_6(String schedule3_6) {
         this.schedule3_6 = schedule3_6;
      }
      public String getSchedule1_7() {
         return schedule1_7;
      }
      public void setSchedule1_7(String schedule1_7) {
         this.schedule1_7 = schedule1_7;
      }
      public String getSchedule2_7() {
         return schedule2_7;
      }
      public void setSchedule2_7(String schedule2_7) {
         this.schedule2_7 = schedule2_7;
      }
      public String getSchedule3_7() {
         return schedule3_7;
      }
      public void setSchedule3_7(String schedule3_7) {
         this.schedule3_7 = schedule3_7;
      }
   
      public int getLmonth() {
         return lmonth;
      }
      public void setLmonth(int lmonth) {
         this.lmonth = lmonth;
      }
      public int getLastDayOfMonth() {
         return lastDayOfMonth;
      }
      public void setLastDayOfMonth(int lastDayOfMonth) {
         this.lastDayOfMonth = lastDayOfMonth;
      }
      public int getPageIndex1() {
         return pageIndex1;
      }
      public void setPageIndex1(int pageIndex1) {
         this.pageIndex1 = pageIndex1;
      }
      public int getPageIndex2() {
         return pageIndex2;
      }
      public void setPageIndex2(int pageIndex2) {
         this.pageIndex2 = pageIndex2;
      }
      public int getPageUnit() {
         return pageUnit;
      }
      public void setPageUnit(int pageUnit) {
         this.pageUnit = pageUnit;
      }
      public int getFirstIndex1() {
         return firstIndex1;
      }
      public void setFirstIndex1(int firstIndex1) {
         this.firstIndex1 = firstIndex1;
      }
      public int getLastIndex1() {
         return lastIndex1;
      }
      public void setLastIndex1(int lastIndex1) {
         this.lastIndex1 = lastIndex1;
      }
      public int getFirstIndex2() {
         return firstIndex2;
      }
      public void setFirstIndex2(int firstIndex2) {
         this.firstIndex2 = firstIndex2;
      }
      public int getLastIndex2() {
         return lastIndex2;
      }
      public void setLastIndex2(int lastIndex2) {
         this.lastIndex2 = lastIndex2;
      }
      public int getRecordCountPerPage1() {
         return recordCountPerPage1;
      }
      public void setRecordCountPerPage1(int recordCountPerPage1) {
         this.recordCountPerPage1 = recordCountPerPage1;
      }
      public int getRecordCountPerPage2() {
         return recordCountPerPage2;
      }
      public void setRecordCountPerPage2(int recordCountPerPage2) {
         this.recordCountPerPage2 = recordCountPerPage2;
      }
      public int getLastPage1() {
         return lastPage1;
      }
      public void setLastPage1(int lastPage1) {
         this.lastPage1 = lastPage1;
      }
      public int getLastPage2() {
         return lastPage2;
      }
      public void setLastPage2(int lastPage2) {
         this.lastPage2 = lastPage2;
      }
      public String getCount() {
         return count;
      }
      public void setCount(String count) {
         this.count = count;
      }
      public String getSeats() {
         return seats;
      }
      public void setSeats(String seats) {
         this.seats = seats;
      }
      public String getU1t1() {
         return u1t1;
      }
      public void setU1t1(String u1t1) {
         this.u1t1 = u1t1;
      }
      public String getU1t2() {
         return u1t2;
      }
      public void setU1t2(String u1t2) {
         this.u1t2 = u1t2;
      }
      public String getU1t3() {
         return u1t3;
      }
      public void setU1t3(String u1t3) {
         this.u1t3 = u1t3;
      }
      
      public String getMvunixtime() {
         return mvunixtime;
      }
      public void setMvunixtime(String mvunixtime) {
         this.mvunixtime = mvunixtime;
      }
      public String getMvvolumeunix() {
         return mvvolumeunix;
      }
      public void setMvvolumeunix(String mvvolumeunix) {
         this.mvvolumeunix = mvvolumeunix;
      }
      public String getMvdirector() {
         return mvdirector;
      }
      public void setMvdirector(String mvdirector) {
         this.mvdirector = mvdirector;
      }
      public String getMvgenre() {
         return mvgenre;
      }
      public void setMvgenre(String mvgenre) {
         this.mvgenre = mvgenre;
      }
      public String getDday() {
         return dday;
      }
      public void setDday(String dday) {
         this.dday = dday;
      }
      public String getBranch() {
         return branch;
      }
      public void setBranch(String branch) {
         this.branch = branch;
      }
      public String getMvseat() {
         return mvseat;
      }
      public void setMvseat(String mvseat) {
         this.mvseat = mvseat;
      }
      public String getMvdate() {
         return mvdate;
      }
      public void setMvdate(String mvdate) {
         this.mvdate = mvdate;
      }
      public int getSmonth() {
         return smonth;
      }
      public void setSmonth(int smonth) {
         this.smonth = smonth;
      }
      public int getSyear() {
         return syear;
      }
      public void setSyear(int syear) {
         this.syear = syear;
      }
      public int getSday() {
         return sday;
      }
      public void setSday(int sday) {
         this.sday = sday;
      }
      public int getLday() {
         return lday;
      }
      public void setLday(int lday) {
         this.lday = lday;
      }
      public String getUnq() {
         return unq;
      }
      public void setUnq(String unq) {
         this.unq = unq;
      }
      public String getMvtitle() {
         return mvtitle;
      }
      public void setMvtitle(String mvtitle) {
         this.mvtitle = mvtitle;
      }
      public String getMvgrade() {
         return mvgrade;
      }
      public void setMvgrade(String mvgrade) {
         this.mvgrade = mvgrade;
      }
      public String getMvpost() {
         return mvpost;
      }
      public void setMvpost(String mvpost) {
         this.mvpost = mvpost;
      }
      public String getStartday() {
         return startday;
      }
      public void setStartday(String startday) {
         this.startday = startday;
      }
      public String getLastday() {
         return lastday;
      }
      public void setLastday(String lastday) {
         this.lastday = lastday;
      }
      public String getMvinfo() {
         return mvinfo;
      }
      public void setMvinfo(String mvinfo) {
         this.mvinfo = mvinfo;
      }
      public String getMvprev() {
         return mvprev;
      }
      public void setMvprev(String mvprev) {
         this.mvprev = mvprev;
      }

      public String getMvlocation() {
         return mvlocation;
      }
      public void setMvlocation(String mvlocation) {
         this.mvlocation = mvlocation;
      }
      public String getMvroom() {
         return mvroom;
      }
      public void setMvroom(String mvroom) {
         this.mvroom = mvroom;
      }
      public String getMvvolume() {
         return mvvolume;
      }
      public void setMvvolume(String mvvolume) {
         this.mvvolume = mvvolume;
      }
      public String getMvschedule() {
         return mvschedule;
      }
      public void setMvschedule(String mvschedule) {
         this.mvschedule = mvschedule;
      }
      public String getSchedule1_1() {
         return schedule1_1;
      }
      public void setSchedule1_1(String schedule1_1) {
         this.schedule1_1 = schedule1_1;
      }
      public String getSchedule2_1() {
         return schedule2_1;
      }
      public void setSchedule2_1(String schedule2_1) {
         this.schedule2_1 = schedule2_1;
      }
      public String getSchedule3_1() {
         return schedule3_1;
      }
      public void setSchedule3_1(String schedule3_1) {
         this.schedule3_1 = schedule3_1;
      }
      public String getSchedule1_2() {
         return schedule1_2;
      }
      public void setSchedule1_2(String schedule1_2) {
         this.schedule1_2 = schedule1_2;
      }
      public String getSchedule2_2() {
         return schedule2_2;
      }
      public void setSchedule2_2(String schedule2_2) {
         this.schedule2_2 = schedule2_2;
      }
      public String getSchedule3_2() {
         return schedule3_2;
      }
      public void setSchedule3_2(String schedule3_2) {
         this.schedule3_2 = schedule3_2;
      }
      public String getSchedule1_3() {
         return schedule1_3;
      }
      public void setSchedule1_3(String schedule1_3) {
         this.schedule1_3 = schedule1_3;
      }
      public String getSchedule2_3() {
         return schedule2_3;
      }
      public void setSchedule2_3(String schedule2_3) {
         this.schedule2_3 = schedule2_3;
      }
      public String getSchedule3_3() {
         return schedule3_3;
      }
      public void setSchedule3_3(String schedule3_3) {
         this.schedule3_3 = schedule3_3;
      }
      
      //스토어
      
      String mdname;
      String mdphoto; 
      String mddetail; 
      String mdprice; 
      String expirationdate;
      
      //리스트 서치
      
      String searchCondition;
  	  String searchKeyword;




	public String getMdname() {
		return mdname;
	}
	public void setMdname(String mdname) {
		this.mdname = mdname;
	}
	public String getMdphoto() {
		return mdphoto;
	}
	public void setMdphoto(String mdphoto) {
		this.mdphoto = mdphoto;
	}
	public String getMddetail() {
		return mddetail;
	}
	public void setMddetail(String mddetail) {
		this.mddetail = mddetail;
	}
	public String getMdprice() {
		return mdprice;
	}
	public void setMdprice(String mdprice) {
		this.mdprice = mdprice;
	}
	public String getExpirationdate() {
		return expirationdate;
	}
	public void setExpirationdate(String expirationdate) {
		this.expirationdate = expirationdate;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
    
           
}