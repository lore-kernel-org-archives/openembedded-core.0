Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4188671F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 03:21:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2A3LC7Z022594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Mar 2015 20:21:12 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 20:21:11 -0700
Message-ID: <54FE6326.4040407@windriver.com>
Date: Tue, 10 Mar 2015 11:21:10 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1425885208.git.liezhi.yang@windriver.com>
	<a27ea935811250778c8d581dbe107a7151b2ac5f.1425885208.git.liezhi.yang@windriver.com>
	<C089D3E9-4157-4FCA-B39D-7A3FF80B97D2@gmail.com>
	<CAJTo0LZQFif9FAnFA0XAwQWPL2pnYD+Wg7PTC1i34hnzswg=pQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZQFif9FAnFA0XAwQWPL2pnYD+Wg7PTC1i34hnzswg=pQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] net-tools: fix SRC_URI
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
X-List-Received-Date: Tue, 10 Mar 2015 03:21:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/10/2015 12:06 AM, Burton, Ross wrote:
>
> On 9 March 2015 at 16:03, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     it would be nicer to use
>     http://archive.debian.org/debian/pool/main/n/net-tools/ instead of
>     snapshot.debian.org <http://snapshot.debian.org> through out this series
>
>
> Apart from that 1.6.0-25.diff.gz isn't in
> http://archive.debian.org/debian/pool/main/n/net-tools/.

Yes, that's why we need fix it.

// Robert

>
> Ross

