// /**
//      * Sirve para hacer inner join entre dos tablas
//      * @param {*} table1 la primera tabla: un array de objetos donde cada objeto representa una fila y el array representa la tabla
//      * @param {*} table2 la segunda tabla: un array de objetos donde cada objeto representa una fila y el array representa la tabla
//      * @param {*} col1 el valor para el match en la primera tabla
//      * @param {*} col2 el valor para el match en la segunda tabla
//      * ```
//      * var = 'hello'
//      * ```
//      * @returns el array de resultados
//      * Nota: si dos objetos (filas) tienen nombres de sus keys iguales sera sobreescrita por el segundo key al momento de usar el spread operator dentro de la funcion, por eso se recomienda que se pongan diferentes antes de hacer el join para evitar esto 
//      */
//  export function innerJoin(
//   table1,
//   table2,
//   col1,
//   col2,
//   // table1Name = "table1",
//   // table2Name = "table2"
// ) {
//   table1 = table1.filter((x) => x[col1] !== null);
//   table2 = table2.filter((x) => x[col2] !== null);
//   table1 = table1.sort((a, b) => a[col1] - b[col1]);
//   table2 = table2.sort((a, b) => a[col2] - b[col2]);

//   let t1Keys = table1.map((t1) => t1[col1].toString());
//   // let t2Keys = table2.map((t2) => t2[col2]);

//   let join = table2
//     .map((row2) => {
//       let f = t1Keys.indexOf(row2[col2].toString());
//       let l = t1Keys.lastIndexOf(row2[col2].toString());
//       let arr = [];
//       // let obj1 = {};
//       if (f >= 0 && l >= 0) {
//         let t1Slice = table1.slice(f, l + 1);
//         for (let i = 0; i < t1Slice.length; i++) {
//           const row1 = t1Slice[i];
//           // let row1Name = Object.keys({ table1 })[0];
//           arr.push({
//             ...row1,
//             ...row2,
//           });
//         }
//         return arr;
//       }

//       return [];
//     })
//     .filter((x) => x.length > 0);

//   join = [].concat.apply([], join);

//   return join;
// }

// export function rightJoin(
//   table1,
//   table2,
//   col1,
//   col2,
//   // table1Name = "table1",
//   // table2Name = "table2"
// ) {
//   table1 = table1.filter((x) => x[col1] !== null);
//   table2 = table2.filter((x) => x[col2] !== null);
//   table1 = table1.sort((a, b) => a[col1] - b[col1]);
//   table2 = table2.sort((a, b) => a[col2] - b[col2]);

//   let t1Keys = table1.map((t1) => t1[col1].toString());
//   // let t2Keys = table2.map((t2) => t2[col2]);

//   let join = table2
//     .map((row2) => {
//       let f = t1Keys.indexOf(row2[col2].toString());
//       let l = t1Keys.lastIndexOf(row2[col2].toString());
//       let arr = [];
//       // let obj1 = {};
//       if (f >= 0 && l >= 0) {
//         let t1Slice = table1.slice(f, l + 1);
//         for (let i = 0; i < t1Slice.length; i++) {
//           const row1 = t1Slice[i];
//           // let row1Name = Object.keys({ table1 })[0];
//           arr.push({
//             ...row2,
//             ...row1,
//           });
//         }
//         return arr;
//       } else {
//         let row1 = table1[0]
//         for (const col in row1) {
//           if (Object.hasOwnProperty.call(row1, col)) {
//             const el = row1[col];
//             row1[col] = null;
//           }
//         }
//         // console.log(row1);
//         arr.push({
//           ...row1,
//           ...row2,
//         })
//         return arr
//       }
//     })
//     .filter((x) => x.length > 0);

//   join = [].concat.apply([], join);

//   return join;
// }


// export function leftJoin(
//   table1,
//   table2,
//   col1,
//   col2,
//   // table1Name = "table1",
//   // table2Name = "table2"
// ) {
//   table1 = table1.filter((x) => x[col1] !== null);
//   table2 = table2.filter((x) => x[col2] !== null);
//   table1 = table1.sort((a, b) => a[col1] - b[col1]);
//   table2 = table2.sort((a, b) => a[col2] - b[col2]);

//   let t2Keys = table2.map((t2) => t2[col2].toString());
//   // let t2Keys = table2.map((t2) => t2[col2]);

//   let join = table1
//     .map((row1) => {
//       let f = t2Keys.indexOf(row1[col1].toString());
//       let l = t2Keys.lastIndexOf(row1[col1].toString());
//       let arr = [];
//       // let obj1 = {};
//       if (f >= 0 && l >= 0) {
//         let t2Slice = table2.slice(f, l + 1);
//         for (let i = 0; i < t2Slice.length; i++) {
//           const row2 = t2Slice[i];
//           // let row1Name = Object.keys({ table2 })[0];
//           arr.push({
//             ...row1,
//             ...row2,
//           });
//         }
//         return arr;
//       } else {
//         let row2 = table2[0]
//         for (const col in row2) {
//           if (Object.hasOwnProperty.call(row2, col)) {
//             const el = row2[col];
//             row2[col] = null;
//           }
//         }
//         // console.log(row2, row1);
//         arr.push({
//           ...row2,
//           ...row1,
//         })
//         return arr
//       }
//     })
//     .filter((x) => x.length > 0);

//   join = [].concat.apply([], join);

//   return join;
// }

