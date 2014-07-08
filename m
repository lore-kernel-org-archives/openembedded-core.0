Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87DFC6FE64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 07:11:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s687BCak015864
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 00:11:12 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 8 Jul 2014 00:11:11 -0700
Message-ID: <53BB998E.8080605@windriver.com>
Date: Tue, 8 Jul 2014 15:11:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Bryan <just4tech83@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <CAD2C2VS999rDn_WEdtaiRPMdtCFgbzY_iqm2ex6Kc3Vm0f8NaQ@mail.gmail.com>
In-Reply-To: <CAD2C2VS999rDn_WEdtaiRPMdtCFgbzY_iqm2ex6Kc3Vm0f8NaQ@mail.gmail.com>
Subject: Re: OpenEmbedded build issues with beagle board
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
X-List-Received-Date: Tue, 08 Jul 2014 07:11:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2014 02:52 PM, Bryan wrote:
>
>
> Hi All
>   I am trying to build  Openembeeded classic for Beagle board-XM but i am
> getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
> local.conf.   Is this approach  ok? or should i move to openembedded core ??
> Pls suggest.
>
> Broken link e.g.
>
> Resolving www.angstrom-distribution.org <http://www.angstrom-distribution.org>
> (www.angstrom-distribution.org <http://www.angstrom-distribution.org>)...
> 140.211.169.177
>   Connecting to www.angstrom-distribution.org
> <http://www.angstrom-distribution.org> (www.angstrom-distribution.org

Where is the www.angstrom-distribution.org from, please ? Maybe you need check
the customized distro file angstrom-2010.x (.conf) ?

// Robert

> <http://www.angstrom-distribution.org>)|140.211.169.177|:80... connected.
>   HTTP request sent, awaiting response...
> 404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.
>
> Thanks in advance
>
>
>

