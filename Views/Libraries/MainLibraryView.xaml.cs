using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace LibraryManagementApplication.Views.Libraries
{
    /// <summary>
    /// Interaction logic for MainLibraryView.xaml
    /// </summary>
    public partial class MainLibraryView : Window
    {
        public MainLibraryView()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnLibraryInvoice_Click(object sender, RoutedEventArgs e)
        {
            LibraryInvoice libraryInvoice = new LibraryInvoice();
            libraryInvoice.ShowDialog();
        }

        private void btnAddToLibrary_Click(object sender, RoutedEventArgs e)
        {
            AddToLibraryView lb = new AddToLibraryView();
            lb.ShowDialog();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

        }
    }
}
