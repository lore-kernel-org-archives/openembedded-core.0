Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 80FFC74678
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 07:02:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2U72Y4Z001091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Mar 2018 00:02:34 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 30 Mar 2018 00:02:33 -0700
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
To: <raj.khem@gmail.com>
References: <87c868ca-4fd7-9b78-ce49-167b140280ab@windriver.com>
Message-ID: <e5854796-409d-4932-8c0d-1bba0af90357@windriver.com>
Date: Fri, 30 Mar 2018 15:03:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87c868ca-4fd7-9b78-ce49-167b140280ab@windriver.com>
X-Originating-IP: [128.224.162.148]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Question about one oe-core commit
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
X-List-Received-Date: Fri, 30 Mar 2018 07:02:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

ping.

// Hongzhi

On 2018年03月28日 17:18, Hongzhi, Song wrote:
> Hi, Khem
>
> oe-core upstream commit e6c1765a05c1321f08f3d1fb521dfe6b07bc8e92
>
> You drop mount propagation patch, it only happens with libseccomp, OE 
> doesn't enable it.
>
> I don't understand why 'it only happens with libseccomp'. Could you 
> make an detailed explanation
>
> for me? I investigated the ubuntu1604, which also has no 
> 'MountFlags=slave' in systemd-udevd.service.
>
>
> Thanks.
>
> Hongzhi
>


