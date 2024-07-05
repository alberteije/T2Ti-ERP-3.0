using NHibernate;
using System.Collections.Generic;
using T2TiRetaguardaSH.Models;
using T2TiRetaguardaSH.NHibernate;

namespace T2TiRetaguardaSH.Services
{
    public class ErpTipoPlanoService
    {

        public IEnumerable<ErpTipoPlanoModel> GetList()
        {
            IList<ErpTipoPlanoModel> Result = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                Result = DAL.Select(new ErpTipoPlanoModel());
            }
            return Result;
        }

        public IEnumerable<ErpTipoPlanoModel> GetListFilter(Filtro filterObj)
        {
            IList<ErpTipoPlanoModel> Result = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                var Query = "from ErpTipoPlanoModel where " + filterObj.Where;
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                Result = DAL.SelectListaSql<ErpTipoPlanoModel>(Query);
            }
            return Result;
        }
		
        public ErpTipoPlanoModel GetObject(int id)
        {
            ErpTipoPlanoModel Result = null;
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                Result = DAL.SelectId<ErpTipoPlanoModel>(id);
            }
            return Result;
        }
		
        public void Insert(ErpTipoPlanoModel obj)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                DAL.SaveOrUpdate(obj);
                Session.Flush();
            }
        }

        public void Update(ErpTipoPlanoModel obj)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                DAL.SaveOrUpdate(obj);
                Session.Flush();
            }
        }

        public void Delete(ErpTipoPlanoModel obj)
        {
            using (ISession Session = NHibernateHelper.GetSessionFactory().OpenSession())
            {
                NHibernateDAL<ErpTipoPlanoModel> DAL = new NHibernateDAL<ErpTipoPlanoModel>(Session);
                DAL.Delete(obj);
                Session.Flush();
            }
        }
		
    }

}