#include <iostream>

using namespace std;

int main()
{
    int a,b,n1,n2,start,r,rdy;
    int q=0;
    cout << " Donner une valeur à n1:" << endl;
    cin>>n1;
    cout << " Donner une valeur à n2:" << endl;
    cin>>n2;
    rdy=1;
    cout<<"rdy="<<rdy<<endl;
    cout << " Donner une valeur à start:" << endl;
    cin>>start;
    if(start==1){
        rdy=0;
    cout<<"rdy="<<rdy<<endl;
        cout<<"****Resultat non disponible pour l\'instant****"<<endl;
        a=n1;
        b=n2;
        while(a>=b)
        {
            a-=b;
            q++;
        }
        start=0;
    }
    rdy=1;
    cout<<"start="<<start<<endl;
    cout<<"rdy="<<rdy<<endl;
    r=q;
    cout<<" ****Affichage resultat de calcul**** "<<endl;
    cout<<"a="<<a<<endl;
    cout<<"b="<<b<<endl;
    cout<<"r="<<r<<endl;
    return 0;
}
