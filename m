Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23B0B75A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 09:54:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t999seQh001847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Oct 2015 02:54:40 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 9 Oct 2015 02:54:39 -0700
Message-ID: <56178EDE.5040508@windriver.com>
Date: Fri, 9 Oct 2015 17:54:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAP71WjwYnv8WjH=s4gLVwwZV5KDdR=N5uxp9m46L_PesCBoZWA@mail.gmail.com>
In-Reply-To: <CAP71WjwYnv8WjH=s4gLVwwZV5KDdR=N5uxp9m46L_PesCBoZWA@mail.gmail.com>
Subject: Re: Too late for mesa upgrade before jethro?
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
X-List-Received-Date: Fri, 09 Oct 2015 09:54:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/09/2015 05:15 PM, Nicolas Dechesne wrote:
> Hi,
>
> I am testing right now a patch to upgrade mesa from 10.6.3 to 10.6.9, is it too
> late for including it in jethro?

Generally speaking, yes, it is late, the feature cut off is
is Sept. 28, 2015 noon GMT., here is the 1.9 Schedule:

https://wiki.yoctoproject.org/wiki/Yocto_1.9_Schedule

// Robert

>
> I should be able to send it on Monday.. If it's too late, i will switch to mesa
> 11 directly.
>
> Nico
>
>
>

