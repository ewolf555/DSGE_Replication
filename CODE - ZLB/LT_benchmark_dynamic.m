function [residual, g1, g2, g3] = LT_benchmark_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(26, 1);
lhs =y(7);
rhs =y(8)+y(9);
residual(1)= lhs-rhs;
lhs =y(10);
rhs =y(33)+y(11)-y(34)-y(16);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(8)*(-params(14))+params(10)*y(17);
residual(3)= lhs-rhs;
lhs =y(18);
rhs =y(34)*params(1)-params(15)*y(20);
residual(4)= lhs-rhs;
lhs =y(20);
rhs =y(10)-y(7)*(params(3)+params(2))/(1-params(3));
residual(5)= lhs-rhs;
lhs =0;
rhs =(y(11)-log(params(1)))*(y(17)-y(8)+y(11)*params(9));
residual(6)= lhs-rhs;
lhs =y(11);
rhs =max(log(params(1)),y(12));
residual(7)= lhs-rhs;
lhs =y(3);
rhs =y(17)+y(18)-y(13);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =y(9)+(1+params(17)-params(11))*y(2)+(1+params(17))*params(12)*(y(1)-y(18))-y(15)-y(13)*params(8);
residual(9)= lhs-rhs;
lhs =y(29);
rhs =y(14)/4;
residual(10)= lhs-rhs;
lhs =y(21);
rhs =y(15)+params(11)*y(2);
residual(11)= lhs-rhs;
lhs =y(9);
rhs =x(it_, 2);
residual(12)= lhs-rhs;
lhs =y(15);
rhs =(-x(it_, 1));
residual(13)= lhs-rhs;
lhs =y(22);
rhs =y(11)-y(34);
residual(14)= lhs-rhs;
lhs =y(16);
rhs =x(it_, 3);
residual(15)= lhs-rhs;
lhs =y(19);
rhs =(y(18)+y(4)+y(5)+y(6))/4;
residual(16)= lhs-rhs;
lhs =y(27);
rhs =4*y(19);
residual(17)= lhs-rhs;
lhs =y(23);
rhs =y(29)-y(7);
residual(18)= lhs-rhs;
lhs =y(12);
rhs =y(16)+y(18)*params(18);
residual(19)= lhs-rhs;
lhs =y(26);
rhs =4*y(22)+0.02;
residual(20)= lhs-rhs;
lhs =y(25);
rhs =y(18)*4;
residual(21)= lhs-rhs;
lhs =y(24);
rhs =0.02+y(11)*4;
residual(22)= lhs-rhs;
lhs =y(28);
rhs =0.02+y(16)*4;
residual(23)= lhs-rhs;
lhs =y(30);
rhs =y(7)*(1-1/params(7))-y(9)+y(17)*params(8)*(1-params(1));
residual(24)= lhs-rhs;
lhs =y(31);
rhs =y(4);
residual(25)= lhs-rhs;
lhs =y(32);
rhs =y(5);
residual(26)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(26, 37);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,8)=(-1);
  g1(1,9)=(-1);
  g1(2,10)=1;
  g1(2,33)=(-1);
  g1(2,11)=(-1);
  g1(2,16)=1;
  g1(2,34)=1;
  g1(3,8)=params(14);
  g1(3,10)=1;
  g1(3,17)=(-params(10));
  g1(4,18)=1;
  g1(4,34)=(-params(1));
  g1(4,20)=params(15);
  g1(5,7)=(params(3)+params(2))/(1-params(3));
  g1(5,10)=(-1);
  g1(5,20)=1;
  g1(6,8)=y(11)-log(params(1));
  g1(6,11)=(-(y(17)-y(8)+y(11)*params(9)+(y(11)-log(params(1)))*params(9)));
  g1(6,17)=(-(y(11)-log(params(1))));
  g1(7,11)=1;
  g1(7,12)=(-(1-(log(params(1))>y(12))));
  g1(8,13)=1;
  g1(8,3)=1;
  g1(8,17)=(-1);
  g1(8,18)=(-1);
  g1(9,9)=(-1);
  g1(9,1)=(-((1+params(17))*params(12)));
  g1(9,13)=params(8);
  g1(9,2)=(-(1+params(17)-params(11)));
  g1(9,14)=1;
  g1(9,15)=1;
  g1(9,18)=(1+params(17))*params(12);
  g1(10,14)=(-0.25);
  g1(10,29)=1;
  g1(11,2)=(-params(11));
  g1(11,15)=(-1);
  g1(11,21)=1;
  g1(12,9)=1;
  g1(12,36)=(-1);
  g1(13,15)=1;
  g1(13,35)=1;
  g1(14,11)=(-1);
  g1(14,34)=1;
  g1(14,22)=1;
  g1(15,16)=1;
  g1(15,37)=(-1);
  g1(16,4)=(-0.25);
  g1(16,18)=(-0.25);
  g1(16,19)=1;
  g1(16,5)=(-0.25);
  g1(16,6)=(-0.25);
  g1(17,19)=(-4);
  g1(17,27)=1;
  g1(18,7)=1;
  g1(18,23)=1;
  g1(18,29)=(-1);
  g1(19,12)=1;
  g1(19,16)=(-1);
  g1(19,18)=(-params(18));
  g1(20,22)=(-4);
  g1(20,26)=1;
  g1(21,18)=(-4);
  g1(21,25)=1;
  g1(22,11)=(-4);
  g1(22,24)=1;
  g1(23,16)=(-4);
  g1(23,28)=1;
  g1(24,7)=(-(1-1/params(7)));
  g1(24,9)=1;
  g1(24,17)=(-(params(8)*(1-params(1))));
  g1(24,30)=1;
  g1(25,4)=(-1);
  g1(25,31)=1;
  g1(26,5)=(-1);
  g1(26,32)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,1369);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],26,50653);
end
end
end
end
