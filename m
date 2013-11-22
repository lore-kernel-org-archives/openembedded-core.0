Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91EE26CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:24:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAMAOHl9029579
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:24:17 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 22 Nov 2013 02:24:16 -0800
Message-ID: <528F30CE.5060409@windriver.com>
Date: Fri, 22 Nov 2013 18:24:14 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?UTF-8?B?VmxhZGltaXIgJ8+GLWNvZGVyL3BoY29kZXInIFNlcmJpbmVua28=?=
	<phcoder@gmail.com>
References: <cover.1385113330.git.jackie.huang@windriver.com>
	<ad8e0d90b31413651a29270546493a6b3ce32865.1385113330.git.jackie.huang@windriver.com>
	<528F2CA2.6000908@gmail.com>
In-Reply-To: <528F2CA2.6000908@gmail.com>
Cc: The development of GRUB 2 <grub-devel@gnu.org>, dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] grub-efi: allow compilation without large model support
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
X-List-Received-Date: Fri, 22 Nov 2013 10:24:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 11/22/2013 6:06 PM, Vladimir 'φ-coder/phcoder' Serbinenko wrote:
> On 22.11.2013 11:00, jackie.huang@windriver.com wrote:
>> +Upstream-Status: Inappropriate [compatibility]
> Should be backport as I'm about to commit my patch upstream once I've
> finished xen part and some documentation pertaining to introduced limits
> (2GiB)

Ok, thanks, changed to backport.

Thanks,
Jackie

>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

