using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eVote
{
    public class Date
    {
        private DateTime Dt;
        public Date(string s)
        {
            try
            {
                string d = null, y = null, m = null;
                d = s.Substring(0, 2);
                m = s.Substring(3, 2);
                y = s.Substring(6, 4);
                Dt = new DateTime(Convert.ToInt32(y), Convert.ToInt32(m), Convert.ToInt32(d));
            }
            catch(Exception e)
            {
                
            }
        }
        public static bool getDate(Date sDate,Date eDate)
        {
            int y = DateTime.Today.Year;
            int m = DateTime.Today.Month;
            int d = DateTime.Today.Day;
            int i = DateTime.Today.CompareTo(sDate.Dt.Date);
            int j = DateTime.Today.CompareTo(eDate.Dt.Date);
            if (i >= 0 && j <= 0)
                return true;
            else
                return false;
        }
    }
}