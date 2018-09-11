Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15232797DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 01:26:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8B1P1CI004724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Sep 2018 18:25:21 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 10 Sep 2018 18:25:00 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
References: <1536564061-127648-1-git-send-email-hongxu.jia@windriver.com>
	<07c22c3e-5575-6b07-4161-f4c0d54212f8@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <4ca2f15f-4a0b-a6ab-ffc3-b3f7d84a107f@windriver.com>
Date: Tue, 11 Sep 2018 09:24:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <07c22c3e-5575-6b07-4161-f4c0d54212f8@gmail.com>
Subject: Re: [PATCH] ghostscript: fix CVE-2018-15908 & CVE-2018-15909 & CVE-2018-15910 & CVE-2018-15911
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
X-List-Received-Date: Tue, 11 Sep 2018 01:26:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月10日 23:16, akuster808 wrote:
> Thank you for the fixes.
>
> Is updating to the  9.24 release an option? I believe there even are
> more vulnerabilities being addressed within that release.

I am afraid it is code freeze, even though upgrading it,
it could not be merged to 2.6

//Hongxu

> - Armin



