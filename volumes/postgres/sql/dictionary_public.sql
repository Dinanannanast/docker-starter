CREATE TABLE IF NOT EXISTS public.mv_organization_mapping (
    organization_id BIGINT PRIMARY KEY,
    organization_code VARCHAR(255),
    name_kk VARCHAR(255),
    name_ru VARCHAR(255),
    full_name_kk VARCHAR(255),
    full_name_ru VARCHAR(255),
    e_otinish_code VARCHAR(255),
    sk_code VARCHAR(255),
    esedo_id VARCHAR(255),
    key VARCHAR(255),
    id VARCHAR(255),
    erap_code VARCHAR(255),
    torelik_name VARCHAR(255),
    region_code VARCHAR(255)
);

INSERT INTO public.mv_organization_mapping (
    organization_id, organization_code, name_kk, name_ru, full_name_kk, full_name_ru, 
    e_otinish_code, sk_code, esedo_id, key, id, erap_code, torelik_name, region_code
) VALUES 
(1, '001', 'Ұйым 1', 'Организация 1', 'Толық Ұйым 1', 'Полное Организация 1', 'EOT001', 'SK001', 'ESEDO001', 'KEY001', 'ID001', 'ERAP001', 'Төрелік 1', 'REG001'),
(2, '002', 'Ұйым 2', 'Организация 2', 'Толық Ұйым 2', 'Полное Организация 2', 'EOT002', 'SK002', 'ESEDO002', 'KEY002', 'ID002', 'ERAP002', 'Төрелік 2', 'REG002'),
(3, '003', 'Ұйым 3', 'Организация 3', 'Толық Ұйым 3', 'Полное Организация 3', 'EOT003', 'SK003', 'ESEDO003', 'KEY003', 'ID003', 'ERAP003', 'Төрелік 3', 'REG003');

CREATE TABLE IF NOT EXISTS public.mv_nsi_control_type (
    key VARCHAR(255) PRIMARY KEY,
    name_kk VARCHAR(255),
    name_ru VARCHAR(255),
    esedo_id VARCHAR(255)
);

INSERT INTO public.mv_nsi_control_type (
    key, name_kk, name_ru, esedo_id
) VALUES 
('KEY001', 'Ұйым 1', 'Организация 1', 'ESEDO001'),
('KEY002', 'Ұйым 2', 'Организация 2', 'ESEDO002'),
('KEY003', 'Ұйым 3', 'Организация 3', 'ESEDO003');

