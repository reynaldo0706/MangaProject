using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangaProject
{
    public partial class _Default : Page
    {

        private MangaModelContainer entities = new MangaModelContainer();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshGrid();

                ddlPub.DataTextField = "Name";
                ddlPub.DataValueField = "Id";
                ddlPub.DataSource = entities.Publishers.ToList();
                ddlPub.DataBind();

                ddlLanguage.DataTextField = "Name";
                ddlLanguage.DataValueField = "Id";
                ddlLanguage.DataSource = entities.Languages.ToList();
                ddlLanguage.DataBind();

                ShowFirstRecord();
            }

        }

        private void ShowFirstRecord()
        {
            Manga manga = entities.Mangas.FirstOrDefault();
            PopulateForm(manga);
        }

        private void PopulateForm(Manga manga)
        {
            hidId.Value = manga.Id.ToString();
            txtTitle.Text = manga.Name;
            txtDescription.Text = manga.Description;
            txtImage.Text = manga.Image;
            txtVolume.Text = manga.Volume;
            txtPubdate.Text = manga.PublishDate.ToString();
            ddlPub.SelectedValue = manga.Publishers.FirstOrDefault().Id.ToString();
            ddlLanguage.SelectedValue = manga.Languages.FirstOrDefault().Id.ToString();
        }

        private void RefreshGrid()
        {
            gvManga.DataSource = entities.Mangas.ToList();
            gvManga.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Manga manga = new Manga();
            manga.Name = txtTitle.Text;
            manga.PublishDate = Convert.ToDateTime(txtPubdate.Text);
            manga.Image = txtImage.Text;
            manga.Description = txtDescription.Text;

            int pubId = Convert.ToInt32(ddlPub.SelectedValue);
            // int lanId = Convert.ToInt32(ddlLanguage.SelectedValue);
            Publisher pub = entities.Publishers.FirstOrDefault(p => p.Id == pubId);
            //Language language = entities.Languages.FirstOrDefault(p => p.Id == lanId);

            manga.Publishers.Add(pub);
            //manga.Languages.Add(language);

            entities.Mangas.Add(manga);

            entities.SaveChanges();

            RefreshGrid();

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int currentId = Convert.ToInt32(hidId.Value);
            Manga manga = entities.Mangas.FirstOrDefault(b => b.Id > currentId);

            if (manga != null)
            {
                PopulateForm(manga);
            }
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {
            int currentId = Convert.ToInt32(hidId.Value);
            Manga manga = entities.Mangas.ToList().LastOrDefault(b => b.Id < currentId);

            if (manga != null)
            {
                PopulateForm(manga);
            }
        }
    }
}