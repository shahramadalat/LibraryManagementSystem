using System.Collections.Generic;
using System.Linq;
using System.Windows;
using Microsoft.Data.SqlClient;




namespace LibraryManagementApplication
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            txtUSer.Focus();
        }
        public static bool IsEmpty<T>(List<T> list)
        {
            if (list == null)
            {
                return true;
            }

            return !list.Any();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Connection con = new Connection();
                con.SingleRecordReader("select * from Account where Username=@username and Password=@pass", new Dictionary<string, string>() { { "@username", txtUSer.Text.Trim() }, { "@pass", txtPass.Password.ToString().Trim() } });
                if (txtUSer.Text == "" || txtUSer.Text == null)
                {
                    txtUSer.Focus();
                    throw new System.Exception("Username can't be empty");
                }
                if (txtPass.Password.ToString() == "" || txtPass.Password.ToString() == null )
                {
                    txtPass.Focus();
                    throw new System.Exception("Password can't be empty");
                }

                if (IsEmpty(con.resultList))
                {
                    throw new System.Exception("username or password is invalid");
                }
                else
                {
                    Home h = new Home(int.Parse(con.resultList[0]), con.resultList[1], con.resultList[2], con.resultList[5]);
                    this.Hide();
                    h.ShowDialog();
                }


               

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


           

        }
    }
}
