function [residual, g1, g2, g3] = impact_zlb_mf_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 26, 1);

%
% Model equations
%

T73 = 1/params(7);
lhs =y(1);
rhs =y(2)+y(3);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =y(4)+y(5)-y(12)-y(10);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(2)*(-params(13))+params(9)*y(11);
residual(3)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(1)-params(14)*y(14);
residual(4)= lhs-rhs;
lhs =y(14);
rhs =y(4)-y(1)*(params(3)+params(2))/(1-params(3));
residual(5)= lhs-rhs;
lhs =y(5);
rhs =max(log(params(1)),y(6));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(12)+y(11)-y(7);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(3)+y(8)*(1+params(16)-params(10))+(y(5)-y(12))*(1+params(16))*params(11)-y(9)-y(7)*params(7);
residual(8)= lhs-rhs;
lhs =y(15);
rhs =y(9)+y(8)*params(10);
residual(9)= lhs-rhs;
lhs =y(7);
rhs =T73*((y(5)-y(12))*(1+params(16))*params(11)+y(3)-y(9));
residual(10)= lhs-rhs;
lhs =y(3);
rhs =x(2);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =(-x(1));
residual(12)= lhs-rhs;
lhs =y(16);
rhs =y(5)-y(12);
residual(13)= lhs-rhs;
lhs =y(10);
rhs =x(3);
residual(14)= lhs-rhs;
lhs =y(13);
rhs =(y(12)+y(12)+y(12)+y(12))/4;
residual(15)= lhs-rhs;
lhs =y(21);
rhs =y(13)*4;
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(8)-y(1);
residual(17)= lhs-rhs;
lhs =y(6);
rhs =(y(2)-y(11))/params(8);
residual(18)= lhs-rhs;
lhs =y(20);
rhs =y(16)*4+0.02;
residual(19)= lhs-rhs;
lhs =y(19);
rhs =y(12)*4;
residual(20)= lhs-rhs;
lhs =y(18);
rhs =0.02+y(5)*4;
residual(21)= lhs-rhs;
lhs =y(22);
rhs =0.02+y(10)*4;
residual(22)= lhs-rhs;
lhs =y(23);
rhs =y(8)/4;
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(23)-y(1);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(12);
residual(25)= lhs-rhs;
lhs =y(26);
rhs =y(12);
residual(26)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(26, 26);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=(-1);
  g1(1,3)=(-1);
  g1(2,5)=(-1);
  g1(2,10)=1;
  g1(2,12)=1;
  g1(3,2)=params(13);
  g1(3,4)=1;
  g1(3,11)=(-params(9));
  g1(4,12)=1-params(1);
  g1(4,14)=params(14);
  g1(5,1)=(params(3)+params(2))/(1-params(3));
  g1(5,4)=(-1);
  g1(5,14)=1;
  g1(6,5)=1;
  g1(6,6)=(-(1-(log(params(1))>y(6))));
  g1(7,7)=1;
  g1(7,12)=(-1);
  g1(8,3)=(-1);
  g1(8,5)=(-((1+params(16))*params(11)));
  g1(8,7)=params(7);
  g1(8,8)=1-(1+params(16)-params(10));
  g1(8,9)=1;
  g1(8,12)=(1+params(16))*params(11);
  g1(9,8)=(-params(10));
  g1(9,9)=(-1);
  g1(9,15)=1;
  g1(10,3)=(-T73);
  g1(10,5)=(-((1+params(16))*params(11)*T73));
  g1(10,7)=1;
  g1(10,9)=T73;
  g1(10,12)=(-(T73*(-((1+params(16))*params(11)))));
  g1(11,3)=1;
  g1(12,9)=1;
  g1(13,5)=(-1);
  g1(13,12)=1;
  g1(13,16)=1;
  g1(14,10)=1;
  g1(15,12)=(-1);
  g1(15,13)=1;
  g1(16,13)=(-4);
  g1(16,21)=1;
  g1(17,1)=1;
  g1(17,8)=(-1);
  g1(17,17)=1;
  g1(18,2)=(-(1/params(8)));
  g1(18,6)=1;
  g1(18,11)=(-((-1)/params(8)));
  g1(19,16)=(-4);
  g1(19,20)=1;
  g1(20,12)=(-4);
  g1(20,19)=1;
  g1(21,5)=(-4);
  g1(21,18)=1;
  g1(22,10)=(-4);
  g1(22,22)=1;
  g1(23,8)=(-0.25);
  g1(23,23)=1;
  g1(24,1)=1;
  g1(24,23)=(-1);
  g1(24,24)=1;
  g1(25,12)=(-1);
  g1(25,25)=1;
  g1(26,12)=(-1);
  g1(26,26)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,676);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],26,17576);
end
end
end
end
