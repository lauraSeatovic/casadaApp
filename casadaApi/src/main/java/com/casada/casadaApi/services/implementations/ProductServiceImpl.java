package com.casada.casadaApi.services.implementations;

import com.casada.casadaApi.DTOs.MassageChairDTO;
import com.casada.casadaApi.DTOs.MassageDeviceDTO;
import com.casada.casadaApi.DTOs.ProductDTO;
import com.casada.casadaApi.DTOs.SportDeviceDTO;
import com.casada.casadaApi.domain.*;
import com.casada.casadaApi.mappers.MassageChairMapper;
import com.casada.casadaApi.mappers.MassageDeviceMapper;
import com.casada.casadaApi.mappers.ProductMapper;
import com.casada.casadaApi.mappers.SportDeviceMapper;
import com.casada.casadaApi.repos.*;
import com.casada.casadaApi.services.ProductService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private MassageChairRepository massageChairRepository;

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private MassageChairMapper massageChairMapper;

    @Autowired
    private MassageDeviceMapper massageDeviceMapper;

    @Autowired
    private SportDeviceMapper sportDeviceMapper;

    @Autowired
    private MassageChairClassRepository massageChairClassRepository;

    @Autowired
    private SportDeviceRepository sportDeviceRepository;

    @Autowired
    private SportDeviceTypeRepository sportDeviceTypeRepository;

    @Autowired
    private MassageDeviceRepository massageDeviceRepository;

    @Autowired
    private MassageDeviceTypeRepository massageDeviceTypeRepository;

    @Override
    public List<ProductDTO> findAll() {
        return productRepository.findAll().stream()
                .map(productMapper::toDTO).collect(Collectors.toList());
    }

    public List<MassageChairDTO> findAllMassageChair(){
        return massageChairRepository.findAll().stream().map(massageChairMapper::toDTO).collect(Collectors.toList());
    }

    public List<MassageDeviceDTO> findAllMassageDevice(){
        return massageDeviceRepository.findAll().stream().map(massageDeviceMapper::toDTO).collect(Collectors.toList());
    }

    public List<SportDeviceDTO> findAllSportDevice(){
        return sportDeviceRepository.findAll().stream().map(sportDeviceMapper::toDTO).collect(Collectors.toList());
    }

    @Transactional
    public Boolean addMassageChair(ProductDTO product, Integer massageChairClassId){
        Product productDomain = productMapper.toDomain(product);
        MassageChairClass massageChairClass = massageChairClassRepository.findById(massageChairClassId).get(); //add is present check
        MassageChair massageChairEntity = new MassageChair(massageChairClass, productDomain);
        massageChairRepository.save(massageChairEntity);
        return true;
    }

    @Transactional
    public Boolean addSportDevice(ProductDTO product, Integer sportDeviceTypeId){
        Product productDomain = productMapper.toDomain(product);
        SportDeviceType sportDeviceType = sportDeviceTypeRepository.findById(sportDeviceTypeId).get();//add is present check
        SportDevice sportDeviceEntity = new SportDevice(sportDeviceType, productDomain);
        sportDeviceRepository.save(sportDeviceEntity);
        return true;
    }

    @Transactional
    public Boolean addMassageDevice(ProductDTO product, Integer massageDeviceTypeId){
        Product productDomain = productMapper.toDomain(product);
        MassageDeviceType massageDeviceType = massageDeviceTypeRepository.findById(massageDeviceTypeId).get();//add is present check
        MassageDevice massageDeviceEntity = new MassageDevice(massageDeviceType, productDomain);
        massageDeviceRepository.save(massageDeviceEntity);
        return true;
    }

    public void removeProduct(int productId){
        productRepository.deleteById(productId);
    }

}