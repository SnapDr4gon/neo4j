// Crear nodos DEPT
CREATE (dept1:DEPT {DEPTNO: 10, DNAME: 'Accounting', LOC: 'New York'})
CREATE (dept2:DEPT {DEPTNO: 20, DNAME: 'Research', LOC: 'Dallas'})
CREATE (dept3:DEPT {DEPTNO: 30, DNAME: 'Sales', LOC: 'Chicago'})
CREATE (dept4:DEPT {DEPTNO: 40, DNAME: 'Operations', LOC: 'Boston'})

// Crear nodos EMP
CREATE (emp1:EMP {EMPNO: 7369, ENAME: 'Smith', JOB: 'Clerk', MGR: 7902, HIREDATE: date('1980-12-17'), SAL: 800, COMM: null, DEPTNO: 20})
CREATE (emp2:EMP {EMPNO: 7499, ENAME: 'Allen', JOB: 'Salesman', MGR: 7698, HIREDATE: date('1981-02-20'), SAL: 1600, COMM: 300, DEPTNO: 30})
CREATE (emp3:EMP {EMPNO: 7521, ENAME: 'Ward', JOB: 'Salesman', MGR: 7698, HIREDATE: date('1981-02-22'), SAL: 1250, COMM: 500, DEPTNO: 30})
CREATE (emp4:EMP {EMPNO: 7566, ENAME: 'Jones', JOB: 'Manager', MGR: 7839, HIREDATE: date('1981-04-02'), SAL: 2975, COMM: null, DEPTNO: 20})
CREATE (emp5:EMP {EMPNO: 7698, ENAME: 'Blake', JOB: 'Manager', MGR: 7839, HIREDATE: date('1981-05-01'), SAL: 2850, COMM: null, DEPTNO: 30})
CREATE (emp6:EMP {EMPNO: 7782, ENAME: 'Clark', JOB: 'Manager', MGR: 7839, HIREDATE: date('1981-06-09'), SAL: 2450, COMM: null, DEPTNO: 10})
CREATE (emp7:EMP {EMPNO: 7839, ENAME: 'King', JOB: 'President', MGR: null, HIREDATE: date('1981-11-17'), SAL: 5000, COMM: null, DEPTNO: 10})
CREATE (emp8:EMP {EMPNO: 7844, ENAME: 'Turner', JOB: 'Salesman', MGR: 7698, HIREDATE: date('1981-09-08'), SAL: 1500, COMM: 0, DEPTNO: 30})
CREATE (emp9:EMP {EMPNO: 7900, ENAME: 'James', JOB: 'Clerk', MGR: 7698, HIREDATE: date('1981-12-03'), SAL: 950, COMM: null, DEPTNO: 30})
CREATE (emp10:EMP {EMPNO: 7934, ENAME: 'Miller', JOB: 'Clerk', MGR: 7782, HIREDATE: date('1982-01-23'), SAL: 1300, COMM: null, DEPTNO: 10})

// Crear relaciones entre EMP y DEPT
MATCH (emp1:EMP), (dept2:DEPT) WHERE emp1.DEPTNO = dept2.DEPTNO CREATE (emp1)-[:BELONGS_TO]->(dept2)
MATCH (emp2:EMP), (dept3:DEPT) WHERE emp2.DEPTNO = dept3.DEPTNO CREATE (emp2)-[:BELONGS_TO]->(dept3)
MATCH (emp3:EMP), (dept3:DEPT) WHERE emp3.DEPTNO = dept3.DEPTNO CREATE (emp3)-[:BELONGS_TO]->(dept3)
MATCH (emp4:EMP), (dept2:DEPT) WHERE emp4.DEPTNO = dept2.DEPTNO CREATE (emp4)-[:BELONGS_TO]->(dept2)
MATCH (emp5:EMP), (dept3:DEPT) WHERE emp5.DEPTNO = dept3.DEPTNO CREATE (emp5)-[:BELONGS_TO]->(dept3)
MATCH (emp6:EMP), (dept1:DEPT) WHERE emp6.DEPTNO = dept1.DEPTNO CREATE (emp6)-[:BELONGS_TO]->(dept1)
MATCH (emp7:EMP), (dept1:DEPT) WHERE emp7.DEPTNO = dept1.DEPTNO CREATE (emp7)-[:BELONGS_TO]->(dept1)
MATCH (emp8:EMP), (dept3:DEPT) WHERE emp8.DEPTNO = dept3.DEPTNO CREATE (emp8)-[:BELONGS_TO]->(dept3)
MATCH (emp9:EMP), (dept3:DEPT) WHERE emp9.DEPTNO = dept3.DEPTNO CREATE (emp9)-[:BELONGS_TO]->(dept3)
MATCH (emp10:EMP), (dept1:DEPT) WHERE emp10.DEPTNO = dept1.DEPTNO CREATE (emp10)-[:BELONGS_TO]->(dept1)

