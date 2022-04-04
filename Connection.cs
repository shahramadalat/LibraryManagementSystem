using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using System.Windows;

namespace LibraryManagementApplication
{
    
    internal class Connection
    {
        public SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-IRGJ8GC; Initial Catalog=LibraryDb; Integrated Security=True; Encrypt=True; TrustServerCertificate=True; User Instance=False");
        public List<string> resultList = new List<string>();
        public void SingleRecordReader(string query, Dictionary<string,string> keyValues)
        { 
            con.Open();
            SqlCommand cmd = new SqlCommand(query,con);
            foreach (KeyValuePair<string,string> kvp in keyValues)
            {
                cmd.Parameters.AddWithValue(kvp.Key,kvp.Value);
            }
            SqlDataReader reader = cmd.ExecuteReader();
            if (!reader.HasRows)
            {
                con.Close();
            }
            else
            {
                while (reader.Read())
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        resultList.Add(reader[i].ToString());
                        // resultList[0] id        1
                        // resultList[1] fuulname  harnas abubabkr
                        // 2 username harnas
                        // 3 password 123
                        // 4 recovery aaa
                        // 5 permission admin

                    }
                }
            }
            //result list
            con.Close();
        }


    }



}
