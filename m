Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACCEF609BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 01:04:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P14Pjk024878
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jun 2014 18:04:25 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 24 Jun 2014 18:04:24 -0700
Message-ID: <53AA2017.1030605@windriver.com>
Date: Wed, 25 Jun 2014 09:04:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <sadlife1990@gmail.com>
References: <CAAHuHfwLfFtraRLwu=Pre4hobHHMVa4QxVwhbAgGuEGSNHWOOA@mail.gmail.com>
In-Reply-To: <CAAHuHfwLfFtraRLwu=Pre4hobHHMVa4QxVwhbAgGuEGSNHWOOA@mail.gmail.com>
X-Forwarded-Message-Id: <CAAHuHfwLfFtraRLwu=Pre4hobHHMVa4QxVwhbAgGuEGSNHWOOA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [Yocto-builds] QT4 lib problem image file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 01:04:31 -0000
X-Groupsio-MsgNum: 54380
Content-Type: multipart/mixed; boundary="------------050605070209060208080307"

--------------050605070209060208080307
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Life,

I think that this email should to into oe-core mailing list, fwd it.

// Robert

-------- Original Message --------
Subject: 	[Yocto-builds] QT4 lib problem image file
Date: 	Tue, 24 Jun 2014 15:53:31 +0300
From: 	Life Life <sadlife1990@gmail.com>
To: 	<yocto-builds@yoctoproject.org>



Hello,

I'm newbie, I'm testing beaglebone black. My setup and instruction following

git clone git://github.com/Angstrom-distribution/setup-scripts.git
<http://github.com/Angstrom-distribution/setup-scripts.git>
cd setup-scripts
MACHINE=beaglebone ./oebb.sh config beaglebone
MACHINE=beaglebone ./oebb.sh update
MACHINE=beaglebone ./oebb.sh
after I run this command

MACHINE=beaglebone ./oebb.sh bitbake -u hob and start hob GUI TOOL
and select beaglebone and QT-embedded package and build image but I cant see my
rootfs in qt lib. Please help.



--------------050605070209060208080307
Content-Type: text/plain; charset="UTF-8"; name="Attached Message Part"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="Attached Message Part"

-- 
_______________________________________________
yocto-builds mailing list
yocto-builds@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto-builds


--------------050605070209060208080307--
