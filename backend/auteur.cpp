#include "auteur.h"

BDR_SQLite3 Auteur::bd("dut_puc2442_proj.db");
vector<string> Auteur::vChamps = {"nom","prenom"};

bool Auteur::ajouter(const string &nom,const string &prenom){
    vector<string> vChamps = {"nom","prenom"};
    vector<string> vValeurs = {"'"+nom+"'","'"+prenom+"'"};

    return bd.ajouter("auteur",vChamps,vValeurs);
}

bool Auteur::modifierNom(unsigned int id,const string &nom){
    return bd.modifier("auteur",{id},{vChamps[0]},{"'"+nom+"'"},"","id");
}

bool Auteur::modifierPrenom(unsigned int id,const string &prenom){
    return bd.modifier("auteur",{id},{vChamps[1]},{"'"+prenom+"'"},"","id");
}

bool Auteur::supprimer(unsigned int id){
    return bd.supprimer("auteur",{id},"id");
}

bool Auteur::consulter(vector<AuteurData> &auteurs){
    vector<string> vValeurs;

    if(!bd.consulter("auteur",vChamps,vValeurs)) return false;

    for(unsigned int i=0;i<vValeurs.size();i+=vChamps.size()){
        AuteurData data(vValeurs[i],vValeurs[i+1]);
        auteurs.push_back(data);
    }

    return true;
}

bool Auteur::exportToFile(vector<AuteurData> data,const string &nom_fichier,const string &separateur){
    ofstream flux(nom_fichier.c_str());
    if(flux){
        flux << "// fichier d'exportation d'auteurs" <<endl;
        flux << "// nom" <<"\t" << "prenom" << endl <<endl;

        for(unsigned int i=0;i<data.size();i++){
            flux << data[i].to_string(separateur) <<endl;
        }
        return true;
    }
    else {
        qDebug() << "erreur d'ouverture du fichier \"" << QString::fromStdString(nom_fichier) << "\"" <<Qt::endl;
        return false;
    }
}

bool Auteur::exportToFile(const string &nom_fichier,const string &separateur){
    vector<AuteurData> data;
    if(consulter(data)){
           return exportToFile(data,nom_fichier,separateur);
    }
    else return false;
}


unsigned int Auteur::importToVector(vector<AuteurData> data,string nom_fichier,const string &separateur){

}

//-----------AuteurData----------------

AuteurData::AuteurData(string nom,string prenom){
    this->nom = nom;
    this->prenom = prenom;
}

void AuteurData::affiche_auteurData(vector<AuteurData> v){
    for(unsigned int i = 0;i<v.size();i++){
        cout << v[i].nom << " - " << v[i].prenom << endl;
    }
}

string AuteurData::to_string(const string &separateur){
    string *res = new string();
    res->append(nom);
    res->append(separateur);
    res->append(prenom);
    return *res;
}
