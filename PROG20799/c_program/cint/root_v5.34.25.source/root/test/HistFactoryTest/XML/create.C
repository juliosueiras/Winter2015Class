{
  using namespace RooFit;

  RooWorkspace w("w");
  w.factory("m[0,150]");
  w.factory("Gaussian:signal(m,mean[90],width[15])");
  w.factory("ArgusBG:bkg1(m,m0[160],0.1,3)");
  w.factory("Exponential:bkg2(m,-0.02)");
  w.factory("Uniform:bkg2_unc(m)");
  w.factory("SUM:Model(0.01*signal,0.3*bkg1,0.69*bkg2)");

  RooAbsPdf* pSignal  = w.pdf("signal");
  RooAbsPdf* pBkg1    = w.pdf("bkg1");
  RooAbsPdf* pBkg2    = w.pdf("bkg2");
  RooAbsPdf* pBkg2Unc = w.pdf("bkg2_unc");
  RooAbsPdf* pData    = w.pdf("Model");
  
  RooPlot* frame = w.var("m")->frame();
  pSignal->plotOn(frame,LineColor(kRed));
  pBkg1->plotOn(frame);
  pBkg2->plotOn(frame,LineColor(kGreen+3));
  pData->plotOn(frame,LineColor(kBlack));

  frame->Draw();

  TFile* pOut = new TFile("data/Input.root","RECREATE");

  TH1* h1_data      = new TH1F("Data","data",30,0,150);
  TH1* h1_signal    = new TH1F("signal","signal",30,0,150);
  TH1* h1_bkg1      = new TH1F("background1","background 1",30,0,150);
  TH1* h1_bkg1_low  = new TH1F("background1_Low","background 1",30,0,150);
  TH1* h1_bkg1_high = new TH1F("background1_High","background 1",30,0,150);
  TH1* h1_bkg2      = new TH1F("background2","background 2",30,0,150);
  TH1* h1_bkg2_unc  = new TH1F("bkg2_shape_unc","background 2",30,0,150);

  const int iNsignal = 20;
  const int iNbkg1   = 300;
  const int iNbkg2   = 680;
  const int iNGen    = 15000;

  RooAbsData* pTmpData = 0;

  pTmpData = pSignal->generate(*w.var("m"),NumEvents(iNGen));
  h1_signal = pTmpData->fillHistogram(h1_signal,*w.var("m"));
  h1_signal->Scale(iNsignal*1.0/iNGen);
  delete pTmpData;

  pTmpData = pBkg1->generate(*w.var("m"),NumEvents(iNGen));
  h1_bkg1 = pTmpData->fillHistogram(h1_bkg1,*w.var("m"));
  h1_bkg1->Scale(iNbkg1*1.0/iNGen);
  delete pTmpData;

  w.var("m0")->setVal(150);
  pTmpData = pBkg1->generate(*w.var("m"),NumEvents(iNGen));
  h1_bkg1_low = pTmpData->fillHistogram(h1_bkg1_low,*w.var("m"));
  h1_signal->Scale(iNbkg1*0.95/iNGen);
  delete pTmpData;
  
  w.var("m0")->setVal(170);
  pTmpData = pBkg1->generate(*w.var("m"),NumEvents(iNGen));
  h1_bkg1_high = pTmpData->fillHistogram(h1_bkg1_high,*w.var("m"));
  h1_bkg1_high->Scale(iNbkg1*1.05/iNGen);
  delete pTmpData;

  pTmpData = pBkg2->generate(*w.var("m"),NumEvents(iNGen));
  h1_bkg2 = pTmpData->fillHistogram(h1_bkg2,*w.var("m"));
  h1_bkg2->Scale(iNbkg2*1.0/iNGen);
  delete pTmpData;

  pTmpData = pBkg2Unc->generate(*w.var("m"),NumEvents(iNGen));
  h1_bkg2_unc = pTmpData->fillHistogram(h1_bkg2_unc,*w.var("m"));
  h1_bkg2_unc->Scale(200/h1_bkg2_unc->Integral());
  delete pTmpData;
  
  pTmpData = pData->generate(*w.var("m"),NumEvents(iNsignal + iNbkg1 + iNbkg2));
  h1_data = pTmpData->fillHistogram(h1_data,*w.var("m"));
  delete pTmpData;

  pOut->mkdir("API_vs_XML/SignalRegion/");
  pOut->cd("API_vs_XML/SignalRegion/");
  
  h1_data->Write();
  h1_signal->Write();
  h1_bkg1->Write();
  h1_bkg1_low->Write();
  h1_bkg1_high->Write();
  h1_bkg2->Write();
  h1_bkg2_unc->Write();
  
  pOut->mkdir("API_vs_XML/SidebandRegion/");
  pOut->cd("API_vs_XML/SidebandRegion/");

  TH1* h1_unit_hist = new TH1F("unitHist","unit hist",1,0,1);
  h1_unit_hist->SetBinContent(1,1);
  h1_unit_hist->SetBinError(1,0);

  TH1* h1_data2 = new TH1F("Data","",1,0,1);
  h1_data2->SetBinContent(1,10*iNbkg1);
  h1_data2->SetBinError(1,sqrt(10*iNbkg1));  

  h1_unit_hist->Write();
  h1_data2->Write();
  
  pOut->Close();
}
