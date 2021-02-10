function [residual, g1, g2, g3] = sens_outmul_mf_delta_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
T79 = 1/params(7);
lhs =y(9);
rhs =y(10)+y(11);
residual(1)= lhs-rhs;
lhs =y(12);
rhs =y(27)+y(13)-y(28)-y(17);
residual(2)= lhs-rhs;
lhs =y(12);
rhs =y(10)*(-params(13))+params(9)*y(18);
residual(3)= lhs-rhs;
lhs =y(19);
rhs =y(28)*params(1)-params(14)*y(21);
residual(4)= lhs-rhs;
lhs =y(21);
rhs =y(12)-y(9)*(params(3)+params(2))/(1-params(3));
residual(5)= lhs-rhs;
lhs =y(18);
rhs =y(10)-y(13)*params(8);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(18)+y(19)-y(14);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =y(11)+(1+params(16)-params(10))*y(3)+(1+params(16))*params(11)*(y(2)-y(19))-y(16)-y(14)*params(7);
residual(8)= lhs-rhs;
lhs =y(22);
rhs =y(16)+params(10)*y(3);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =T79*((1+params(16))*params(11)*(y(2)-y(19))+y(11)-y(16));
residual(10)= lhs-rhs;
lhs =y(11);
rhs =params(12)*y(1)+x(it_, 2);
residual(11)= lhs-rhs;
lhs =y(16);
rhs =params(12)*y(4)-x(it_, 1);
residual(12)= lhs-rhs;
lhs =y(23);
rhs =y(13)-y(28);
residual(13)= lhs-rhs;
residual(14) = y(17);
lhs =y(20);
rhs =(y(19)+y(6)+y(7)+y(8))/4;
residual(15)= lhs-rhs;
lhs =y(24);
rhs =y(15)-y(9);
residual(16)= lhs-rhs;
lhs =y(25);
rhs =y(6);
residual(17)= lhs-rhs;
lhs =y(26);
rhs =y(7);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 30);

  %
  % Jacobian matrix
  %

  g1(1,9)=1;
  g1(1,10)=(-1);
  g1(1,11)=(-1);
  g1(2,12)=1;
  g1(2,27)=(-1);
  g1(2,13)=(-1);
  g1(2,17)=1;
  g1(2,28)=1;
  g1(3,10)=params(13);
  g1(3,12)=1;
  g1(3,18)=(-params(9));
  g1(4,19)=1;
  g1(4,28)=(-params(1));
  g1(4,21)=params(14);
  g1(5,9)=(params(3)+params(2))/(1-params(3));
  g1(5,12)=(-1);
  g1(5,21)=1;
  g1(6,10)=(-1);
  g1(6,13)=params(8);
  g1(6,18)=1;
  g1(7,14)=1;
  g1(7,5)=1;
  g1(7,18)=(-1);
  g1(7,19)=(-1);
  g1(8,11)=(-1);
  g1(8,2)=(-((1+params(16))*params(11)));
  g1(8,14)=params(7);
  g1(8,3)=(-(1+params(16)-params(10)));
  g1(8,15)=1;
  g1(8,16)=1;
  g1(8,19)=(1+params(16))*params(11);
  g1(9,3)=(-params(10));
  g1(9,16)=(-1);
  g1(9,22)=1;
  g1(10,11)=(-T79);
  g1(10,2)=(-((1+params(16))*params(11)*T79));
  g1(10,14)=1;
  g1(10,16)=T79;
  g1(10,19)=(-(T79*(-((1+params(16))*params(11)))));
  g1(11,1)=(-params(12));
  g1(11,11)=1;
  g1(11,30)=(-1);
  g1(12,4)=(-params(12));
  g1(12,16)=1;
  g1(12,29)=1;
  g1(13,13)=(-1);
  g1(13,28)=1;
  g1(13,23)=1;
  g1(14,17)=1;
  g1(15,6)=(-0.25);
  g1(15,19)=(-0.25);
  g1(15,20)=1;
  g1(15,7)=(-0.25);
  g1(15,8)=(-0.25);
  g1(16,9)=1;
  g1(16,15)=(-1);
  g1(16,24)=1;
  g1(17,6)=(-1);
  g1(17,25)=1;
  g1(18,7)=(-1);
  g1(18,26)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,900);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,27000);
end
end
end
end
