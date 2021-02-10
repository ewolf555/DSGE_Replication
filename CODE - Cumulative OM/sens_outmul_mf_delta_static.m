function [residual, g1, g2, g3] = sens_outmul_mf_delta_static(y, x, params)
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

residual = zeros( 18, 1);

%
% Model equations
%

T73 = 1/params(7);
lhs =y(1);
rhs =y(2)+y(3);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =y(4)+y(5)-y(11)-y(9);
residual(2)= lhs-rhs;
lhs =y(4);
rhs =y(2)*(-params(13))+params(9)*y(10);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(1)-params(14)*y(13);
residual(4)= lhs-rhs;
lhs =y(13);
rhs =y(4)-y(1)*(params(3)+params(2))/(1-params(3));
residual(5)= lhs-rhs;
lhs =y(10);
rhs =y(2)-y(5)*params(8);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(11)+y(10)-y(6);
residual(7)= lhs-rhs;
lhs =y(7);
rhs =y(3)+y(7)*(1+params(16)-params(10))+(y(5)-y(11))*(1+params(16))*params(11)-y(8)-y(6)*params(7);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(8)+y(7)*params(10);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =T73*((y(5)-y(11))*(1+params(16))*params(11)+y(3)-y(8));
residual(10)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(12)+x(2);
residual(11)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(12)-x(1);
residual(12)= lhs-rhs;
lhs =y(15);
rhs =y(5)-y(11);
residual(13)= lhs-rhs;
residual(14) = y(9);
lhs =y(12);
rhs =(y(11)+y(11)+y(11)+y(11))/4;
residual(15)= lhs-rhs;
lhs =y(16);
rhs =y(7)-y(1);
residual(16)= lhs-rhs;
lhs =y(17);
rhs =y(11);
residual(17)= lhs-rhs;
lhs =y(18);
rhs =y(11);
residual(18)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(18, 18);

  %
  % Jacobian matrix
  %

  g1(1,1)=1;
  g1(1,2)=(-1);
  g1(1,3)=(-1);
  g1(2,5)=(-1);
  g1(2,9)=1;
  g1(2,11)=1;
  g1(3,2)=params(13);
  g1(3,4)=1;
  g1(3,10)=(-params(9));
  g1(4,11)=1-params(1);
  g1(4,13)=params(14);
  g1(5,1)=(params(3)+params(2))/(1-params(3));
  g1(5,4)=(-1);
  g1(5,13)=1;
  g1(6,2)=(-1);
  g1(6,5)=params(8);
  g1(6,10)=1;
  g1(7,6)=1;
  g1(7,11)=(-1);
  g1(8,3)=(-1);
  g1(8,5)=(-((1+params(16))*params(11)));
  g1(8,6)=params(7);
  g1(8,7)=1-(1+params(16)-params(10));
  g1(8,8)=1;
  g1(8,11)=(1+params(16))*params(11);
  g1(9,7)=(-params(10));
  g1(9,8)=(-1);
  g1(9,14)=1;
  g1(10,3)=(-T73);
  g1(10,5)=(-((1+params(16))*params(11)*T73));
  g1(10,6)=1;
  g1(10,8)=T73;
  g1(10,11)=(-(T73*(-((1+params(16))*params(11)))));
  g1(11,3)=1-params(12);
  g1(12,8)=1-params(12);
  g1(13,5)=(-1);
  g1(13,11)=1;
  g1(13,15)=1;
  g1(14,9)=1;
  g1(15,11)=(-1);
  g1(15,12)=1;
  g1(16,1)=1;
  g1(16,7)=(-1);
  g1(16,16)=1;
  g1(17,11)=(-1);
  g1(17,17)=1;
  g1(18,11)=(-1);
  g1(18,18)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,324);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,5832);
end
end
end
end
