mod neutrosophylib_tests {
    use neutrosophylib::neutrosophylib::{
        SVNNTrait, isEqual, isContained,
        intersection, union, complement,
        difference, multiply, add,
        score, accuracy, deneutrosophy
    };

    #[test]
    fn test_svnn_creation(){
        let svnn = SVNNTrait::new(1000, 2000, 3000);
        assert_eq!(svnn.getT(), 1000);
        assert_eq!(svnn.getI(), 2000);
        assert_eq!(svnn.getF(), 3000);
    }

    #[test]
    fn test_svnn_contained(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(3000, 9000, 1100);
        let result = isContained(svnn_1, svnn_2);

        assert_eq!(result, false);

        let svnn_3 = SVNNTrait::new(1000, 9000, 6000);
        let svnn_4 = SVNNTrait::new(3000, 4000, 1100);
        let result = isContained(svnn_3, svnn_4);

        assert_eq!(result, true);
    }

    #[test]
    fn test_svnn_equal(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = isEqual(svnn_1, svnn_2);

        assert_eq!(result, false);

        let result = isEqual(svnn_1, svnn_1);
        assert_eq!(result, true);
    }

    #[test]
    fn test_svnn_union(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = union(svnn_1, svnn_2);

        assert_eq!(result.getT(), 9000);
        assert_eq!(result.getI(), 7000);
        assert_eq!(result.getF(), 0);
    }

    #[test]
    fn test_svnn_intersection(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = intersection(svnn_1, svnn_2);

        assert_eq!(result.getT(), 5000);
        assert_eq!(result.getI(), 2000);
        assert_eq!(result.getF(), 1000);
    }

    #[test]
    fn test_svnn_difference(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = difference(svnn_1, svnn_2);

        assert_eq!(result.getT(), 1000);
        assert_eq!(result.getI(), 2000);
        assert_eq!(result.getF(), 5000);
    }

    #[test]
    fn test_svnn_addition(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = add(svnn_1, svnn_2);

        assert_eq!(result.getT(), 9500);
        assert_eq!(result.getI(), 1400);
        assert_eq!(result.getF(), 0);
    }

    #[test]
    fn test_svnn_multiplication(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let svnn_2 = SVNNTrait::new(5000, 7000, 1000);
        let result = multiply(svnn_1, svnn_2);

        assert_eq!(result.getT(), 4500);
        assert_eq!(result.getI(), 7600);
        assert_eq!(result.getF(), 1000);
    }

    #[test]
    fn test_svnn_complement(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let result = complement(svnn_1);

        assert_eq!(result.getT(), 0);
        assert_eq!(result.getI(), 8000);
        assert_eq!(result.getF(), 9000);
    }

    #[test]
    fn test_svnn_score(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let result = score(svnn_1);

        assert_eq!(result, 9000);
    }

    #[test]
    fn test_svnn_accuracy(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let result = accuracy(svnn_1);

        assert_eq!(result, 7000);
    }

    #[test]
    fn test_svnn_deneutrosophy(){
        let svnn_1 = SVNNTrait::new(9000, 2000, 0);
        let result = deneutrosophy(svnn_1);

        assert_eq!(result, 8712);
    }

}