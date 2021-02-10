function [residual, g1, g2, g3] = nt_df_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(27, 1);
lhs =y(12);
rhs =y(13)+y(14);
residual(1)= lhs-rhs;
lhs =y(15);
rhs =y(39)+y(16)-y(40)-y(20);
residual(2)= lhs-rhs;
lhs =y(15);
rhs =y(13)*(-params(14))+params(10)*y(21);
residual(3)= lhs-rhs;
lhs =y(22);
rhs =y(40)*params(1)-params(15)*y(24);
residual(4)= lhs-rhs;
lhs =y(24);
rhs =y(15)-y(12)*(params(3)+params(2))/(1-params(3));
residual(5)= lhs-rhs;
lhs =y(21);
rhs =y(13)-y(16)*params(9);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(21)+y(22)-y(17);
residual(7)= lhs-rhs;
lhs =y(18);
rhs =y(14)+(1+params(17)-params(11))*y(4)+(1+params(17))*params(12)*(y(2)-y(22))-y(19)-y(17)*params(8);
residual(8)= lhs-rhs;
lhs =y(33);
rhs =y(18)/4;
residual(9)= lhs-rhs;
lhs =y(25);
rhs =y(19)+params(11)*y(4);
residual(10)= lhs-rhs;
residual(11) = y(22);
lhs =y(14);
rhs =params(13)*y(1)+x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(19);
rhs =params(13)*y(5)-x(it_, 1);
residual(13)= lhs-rhs;
lhs =y(26);
rhs =y(16)-y(40);
residual(14)= lhs-rhs;
residual(15) = y(20);
lhs =y(23);
rhs =(y(22)+y(7)+y(8)+y(9))/4;
residual(16)= lhs-rhs;
lhs =y(27);
rhs =y(33)-y(12);
residual(17)= lhs-rhs;
lhs =y(28);
rhs =y(16)*4;
residual(18)= lhs-rhs;
lhs =y(29);
rhs =y(22)*4;
residual(19)= lhs-rhs;
lhs =y(30);
rhs =4*y(26);
residual(20)= lhs-rhs;
lhs =y(31);
rhs =4*y(23);
residual(21)= lhs-rhs;
lhs =y(32);
rhs =(y(17)+y(3)+y(10)+y(11))/4;
residual(22)= lhs-rhs;
lhs =y(34);
rhs =y(12)*(1-1/params(7))-y(14)+y(21)*params(8)*(1-params(1));
residual(23)= lhs-rhs;
lhs =y(35);
rhs =y(7);
residual(24)= lhs-rhs;
lhs =y(36);
rhs =y(8);
residual(25)= lhs-rhs;
lhs =y(37);
rhs =y(3);
residual(26)= lhs-rhs;
lhs =y(38);
rhs =y(10);
residual(27)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(27, 42);

  %
  % Jacobian matrix
  %

  g1(1,12)=1;
  g1(1,13)=(-1);
  g1(1,14)=(-1);
  g1(2,15)=1;
  g1(2,39)=(-1);
  g1(2,16)=(-1);
  g1(2,20)=1;
  g1(2,40)=1;
  g1(3,13)=params(14);
  g1(3,15)=1;
  g1(3,21)=(-params(10));
  g1(4,22)=1;
  g1(4,40)=(-params(1));
  g1(4,24)=params(15);
  g1(5,12)=(params(3)+params(2))/(1-params(3));
  g1(5,15)=(-1);
  g1(5,24)=1;
  g1(6,13)=(-1);
  g1(6,16)=params(9);
  g1(6,21)=1;
  g1(7,17)=1;
  g1(7,6)=1;
  g1(7,21)=(-1);
  g1(7,22)=(-1);
  g1(8,14)=(-1);
  g1(8,2)=(-((1+params(17))*params(12)));
  g1(8,17)=params(8);
  g1(8,4)=(-(1+params(17)-params(11)));
  g1(8,18)=1;
  g1(8,19)=1;
  g1(8,22)=(1+params(17))*params(12);
  g1(9,18)=(-0.25);
  g1(9,33)=1;
  g1(10,4)=(-params(11));
  g1(10,19)=(-1);
  g1(10,25)=1;
  g1(11,22)=1;
  g1(12,1)=(-params(13));
  g1(12,14)=1;
  g1(12,42)=(-1);
  g1(13,5)=(-params(13));
  g1(13,19)=1;
  g1(13,41)=1;
  g1(14,16)=(-1);
  g1(14,40)=1;
  g1(14,26)=1;
  g1(15,20)=1;
  g1(16,7)=(-0.25);
  g1(16,22)=(-0.25);
  g1(16,23)=1;
  g1(16,8)=(-0.25);
  g1(16,9)=(-0.25);
  g1(17,12)=1;
  g1(17,27)=1;
  g1(17,33)=(-1);
  g1(18,16)=(-4);
  g1(18,28)=1;
  g1(19,22)=(-4);
  g1(19,29)=1;
  g1(20,26)=(-4);
  g1(20,30)=1;
  g1(21,23)=(-4);
  g1(21,31)=1;
  g1(22,3)=(-0.25);
  g1(22,17)=(-0.25);
  g1(22,32)=1;
  g1(22,10)=(-0.25);
  g1(22,11)=(-0.25);
  g1(23,12)=(-(1-1/params(7)));
  g1(23,14)=1;
  g1(23,21)=(-(params(8)*(1-params(1))));
  g1(23,34)=1;
  g1(24,7)=(-1);
  g1(24,35)=1;
  g1(25,8)=(-1);
  g1(25,36)=1;
  g1(26,3)=(-1);
  g1(26,37)=1;
  g1(27,10)=(-1);
  g1(27,38)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],27,1764);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],27,74088);
end
end
end
end
