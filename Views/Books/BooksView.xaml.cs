using LibraryManagementApplication.Models;
using LibraryManagementApplication.ViewModels;
using LibraryManagementApplication.Views.Borrow;
using LibraryManagementApplication.Views.Libraries;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace LibraryManagementApplication.Views.Books
{
    /// <summary>
    /// Interaction logic for BooksView.xaml
    /// </summary>
    public partial class BooksView : Window
    {
        //BooksView.LanguageId
        //BooksView.CategoryId
        public static int? LanguageId, CategoryId;
        public static string Language,Category;
        int lastid, UpdateId;
        string IsToChoose = "";
        public BooksView()
        {
            InitializeComponent();
            btnChoose.Visibility = Visibility.Collapsed;
        }
        public BooksView(string isToChoose)
        {
            InitializeComponent();
            IsToChoose= isToChoose;
            if (isToChoose=="user")
            {
                btnInsert.Visibility = Visibility.Collapsed;
                btnDelete.Visibility = Visibility.Collapsed;
                btnChoose.Visibility = Visibility.Collapsed;
                btnCategorey.Visibility = Visibility.Collapsed;
                btnUpdate.Visibility = Visibility.Collapsed;
                btnLanguage.Visibility = Visibility.Collapsed;
                txtPublishDate.Visibility = Visibility.Collapsed;
                txtLanguage.Visibility = Visibility.Collapsed;
                txtCategory.Visibility = Visibility.Collapsed;
                lblSearch.Content = "Search based on Bookname, Auther and Publisher";
                lblPublishDate.Visibility= Visibility.Collapsed;
                lblLanguage.Visibility = Visibility.Collapsed;  
                lblCategorey.Visibility= Visibility.Collapsed;
            }
            if (IsToChoose == "fromLibraryInvoice")
            {
                btnChoose.Visibility = Visibility.Visible;
            }
            if (isToChoose=="fromAddLibraryNote")
            {
                btnChoose.Visibility = Visibility.Visible;
            }
            if (IsToChoose=="fromAddBorrow")
            {
                btnChoose.Visibility = Visibility.Visible;
            }
           
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            GetdatagridItems();
            
        }
        async void GetdatagridItems()
        {
            BookViewModel a = new BookViewModel();
            AccountDatagrid.ItemsSource = await a.GetItemsAsync();
        }

        private async void btnInsert_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                if (txtBookName.Text == "" || txtBookName.Text == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book name must be inserted");
                }
                if (txtAuthor.Text == "" || txtAuthor.Text == null)
                {
                    txtAuthor.Focus();
                    throw new System.Exception("Author must be inserted");
                }
                if (txtPublisher.Text == "" || txtPublisher.Text == null)
                {
                    txtPublisher.Focus();
                    throw new System.Exception("Publisher must be inserted");
                }
                if (txtPublishDate.Text == "" || txtPublishDate.Text == null)
                {
                    txtPublishDate.Focus();
                    throw new System.Exception("Publish date must be inserted");
                }
                if (LanguageId == null || LanguageId == 0 || txtLanguage.Text =="" || txtLanguage.Text == null )
                {
                    throw new System.Exception("please reselect the Language");
                }
                if (CategoryId == null || CategoryId == 0 || txtCategory.Text == "" || txtCategory.Text == null)
                {
                    throw new System.Exception("please reselect the Categorey");
                }
                Book book = new Book();
                BookViewModel bookViewModel = new BookViewModel();
                var lid = await bookViewModel.GetScalerValueAsync("select isnull(max(BookId),0) from Book");
                lastid = int.Parse(lid) + 1;
                book.BookId = lastid;
                book.BookName = txtBookName.Text;
                book.Author = txtAuthor.Text;
                book.PublishDate = System.DateTime.Parse(txtPublishDate.Text.ToString());
                book.Publishar = txtPublisher.Text;
                book.LanguageId = LanguageId;
                book.CategoreyId = CategoryId;
                await bookViewModel.ExcuteAsyncWithParameters("insert into Book values(@id,@name,@auth,@pub,@pubdate,@lang,@cat                                  )",
                     new Dictionary<string, object> {
                        {"@id",book.BookId },
                        {"@name",book.BookName},
                        {"@auth",book.Author },
                        {"@pub",book.Publishar },
                        {"@pubdate",book.PublishDate},
                        {"@lang",book.LanguageId},
                        {"@cat",book.CategoreyId},
                     });
                clear();
                AccountDatagrid.ItemsSource = await bookViewModel.GetItemsAsync();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message,"warrning",MessageBoxButton.OK,MessageBoxImage.Warning);
            }

        }
        void clear()
        {
            txtAuthor.Text = "";
            txtBookName.Text = "";
            txtCategory.Text = "";
            Category = null;
            CategoryId = 0;
            txtLanguage.Text = "";
            Language = null;
            LanguageId = 0;
            txtPublishDate.Text = "";
            txtPublisher.Text = "";

        }
        private async void btnUpdate_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                if (txtBookName.Text == "" || txtBookName.Text == null)
                {
                    txtBookName.Focus();
                    throw new System.Exception("Book name must be inserted");
                }
                if (txtAuthor.Text == "" || txtAuthor.Text == null)
                {
                    txtAuthor.Focus();
                    throw new System.Exception("Author must be inserted");
                }
                if (txtPublisher.Text == "" || txtPublisher.Text == null)
                {
                    txtPublisher.Focus();
                    throw new System.Exception("Publisher must be inserted");
                }
                if (txtPublishDate.Text == "" || txtPublishDate.Text == null)
                {
                    txtPublishDate.Focus();
                    throw new System.Exception("Publish date must be inserted");
                }
                if (LanguageId == null || LanguageId == 0 || txtLanguage.Text == "" || txtLanguage.Text == null)
                {
                    throw new System.Exception("please reselect the Language");
                }
                if (CategoryId == null || CategoryId == 0 || txtCategory.Text == "" || txtCategory.Text == null)
                {
                    throw new System.Exception("please reselect the Categorey");
                }
                Book item = new Book();
                BookViewModel bookViewModel = new BookViewModel();
                int count = int.Parse(await bookViewModel.GetScalerValueAsync($"select count(BookId) from Book where BookId = {UpdateId}"));
                if (count == 0 || count < 1)
                {
                    throw new System.Exception("Unsuccessfull, please try again");
                }

                item.BookId = UpdateId;
                item.BookName = txtBookName.Text;
                item.Author = txtAuthor.Text;
                item.Publishar = txtPublisher.Text;
                item.PublishDate = System.DateTime.Parse(txtPublishDate.Text.ToString());
                item.LanguageId = LanguageId;
                item.CategoreyId = CategoryId;
                await bookViewModel.ExcuteAsyncWithParameters(@"update Book set BookName=@name, Author = @auth, Publishar=@pub, PublishDate=@pubdate,
                                                                    LanguageId=@lang, CategoreyId = @cat where BookId=@id",
                     new Dictionary<string, object> {
                        {"@id",item.BookId },
                        {"@name",item.BookName},
                        {"@auth",item.Author },
                        {"@pub",item.Publishar },
                        {"@pubdate",item.PublishDate},
                        {"@lang",item.LanguageId},
                        {"@cat",item.CategoreyId},
                        });
                UpdateId = 0;
                AccountDatagrid.ItemsSource = await bookViewModel.GetItemsAsync();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            BookViewModel bookViewModel = new BookViewModel();
            try
            {
                await bookViewModel.ExcuteAsyncWithParameters("delete from Book where BookId=@id",
                    new Dictionary<string, object> {
                    {"@id",UpdateId }}
                    );

            }
            catch (System.Exception ex)
            {
                MessageBox.Show("unsuccessfull \n" + ex.Message, "warrning", MessageBoxButton.OK, MessageBoxImage.Warning);
            }

            GetdatagridItems();
            clear();
            var lid = await bookViewModel.GetScalerValueAsync("select top 1 BookId from Book order by BookId desc");
            lastid = int.Parse(lid) + 1;
        }

        private async void btnSearch_Click(object sender, RoutedEventArgs e)
        {
            #region validation for search

            lblSearch.Visibility = Visibility.Visible;
            Book item = new Book();
            if (txtBookName.Text == null || txtBookName.Text == "")
            {
                item.BookName = null;
            }
            else
            {
                item.BookName = txtBookName.Text;

            }
            if (txtAuthor.Text == null || txtAuthor.Text == "")
            {
                item.Author = null;

            }
            else
            {
                item.Author = txtAuthor.Text;
            }
            if (txtPublisher.Text == null || txtPublisher.Text == "")
            {
                item.Publishar = null;

            }
            else
            {
                item.Publishar = txtPublisher.Text;
            }
            if (txtPublisher.Text == null || txtPublisher.Text == "")
            {
                item.Publishar = null;

            }
            else
            {
                item.Publishar = txtPublisher.Text;
            }
            if (txtPublishDate.Text == null || txtPublishDate.Text == "")
            {
                item.PublishDate = null;

            }
            else
            {
                item.PublishDate = System.DateTime.Parse(txtPublishDate.Text.ToString());
            }
            if (txtLanguage.Text == null || txtLanguage.Text == "" || LanguageId==0||LanguageId==null)
            {
                item.LanguageId = null;

            }
            else
            {
                item.LanguageId = LanguageId;
            }
            if (txtCategory.Text == null || txtCategory.Text == "" || CategoryId == 0 || CategoryId == null)
            {
                item.CategoreyId = null;

            }
            else
            {
                item.CategoreyId = CategoryId;
            }
            #endregion



            BookViewModel bookViewModel = new BookViewModel();
            var acc = await bookViewModel.GetFilteredAccountsAsync(new Dictionary<string, object>
            {
                {"@name",item.BookName},
                {"@auth",item.Author},
                {"@pub",item.Publishar},
                {"@lang",item.LanguageId},
                {"@cat",item.CategoreyId},
            });
            AccountDatagrid.ItemsSource = acc;
        }

        private void btnClear_Click(object sender, RoutedEventArgs e)
        {
            txtBookName.Focus();
            clear();
            GetdatagridItems();
        }

        private void btnLanguage_Click(object sender, RoutedEventArgs e)
        {
            LanguageView languageView = new LanguageView();
            languageView.ShowDialog();
            txtLanguage.Text = Language;
        }

        string chosen_name="";
        private void btnChoose_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (IsToChoose=="fromLibraryInvoice")
                {
                    if (chosen_name == "" || chosen_name == null || UpdateId == null || UpdateId == 0)
                    {
                        throw new System.Exception("please choose again");
                    }
                    LibraryInvoice.BookId = UpdateId;
                    LibraryInvoice.BookName = chosen_name;
                    this.Close();
                    return;
                }
                if (IsToChoose== "fromAddBorrow")
                {
                    if (chosen_name == "" || chosen_name == null || UpdateId == null || UpdateId == 0)
                    {
                        throw new System.Exception("please choose again");
                    }
                    AddBorrowView.BookId = UpdateId;
                    AddBorrowView.BookName = chosen_name;
                    this.Close();
                    return;
                }

                if (chosen_name == "" || chosen_name == null || UpdateId == null || UpdateId == 0)
                {
                    throw new System.Exception("please choose again");
                }
                AddToLibraryView.BookId = UpdateId;
                AddToLibraryView.BookName= chosen_name;
                this.Close();

            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            //AddToLibraryView.BookId = 
        }

        private void btnCategorey_Click(object sender, RoutedEventArgs e)
        {
            CategoryView categoryView = new CategoryView();
            categoryView.ShowDialog();
            txtCategory.Text = Category;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void AccountDatagrid_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            var selected = (Book)AccountDatagrid.SelectedItem;
            if (selected != null)
            {
                UpdateId = selected.BookId;
                chosen_name = selected.BookName;
                txtBookName.Text = selected.BookName;
                txtAuthor.Text = selected.Author;
                txtPublisher.Text = selected.Publishar;
                txtPublishDate.Text = selected.PublishDate.ToString();
                txtLanguage.Text = selected.LanguageName;
                LanguageId = selected.LanguageId;
                Language = selected.LanguageName;
                txtCategory.Text = selected.CategoreyName;
                Category = selected.CategoreyName;
                CategoryId = selected.CategoreyId;
                
            }
        }
    }
}
