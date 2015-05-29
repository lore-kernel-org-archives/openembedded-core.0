Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7400F755F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 01:26:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4T1QShJ029454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 18:26:28 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 18:26:27 -0700
Message-ID: <5567C042.1090804@windriver.com>
Date: Fri, 29 May 2015 09:26:26 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1432775689.git.kai.kang@windriver.com>	<0bbc0582db36c1fc63650e96b3eaef3561dd7494.1432775689.git.kai.kang@windriver.com>
	<5566B1D5.9020800@linux.intel.com>
In-Reply-To: <5566B1D5.9020800@linux.intel.com>
Subject: Re: [PATCH 3/5] qt4: fix CVE issues
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
X-List-Received-Date: Fri, 29 May 2015 01:26:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年05月28日 14:12, Alexander Kanavin wrote:
> On 05/28/2015 04:26 AM, Kai Kang wrote:
>> Backport patches to fix qt4 CVE issues:
>>
>> * CVE-2015-1858
>> * CVE-2015-1859
>> * CVE-2015-1860
>
> Qt 4.8.7 is out and (I presume) it has all of those fixes. Why not 
> update to that version instead?

Qt 4.8.7 is released on May 25 and I didn't see it when I made the 
patches. I'll update it.

Regards,
Kai

>
>
> Alex
>


-- 
Regards,
Neil | Kai Kang


