Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 02EF465DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:50:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAB1osJu012894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 10 Nov 2014 17:50:54 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 10 Nov 2014 17:50:54 -0800
Message-ID: <54616B7A.7080009@windriver.com>
Date: Tue, 11 Nov 2014 09:50:50 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415260194.git.Chong.Lu@windriver.com>
	<CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
In-Reply-To: <CAJTo0LZKsp1UvRNVMiFobDo92okUwDdjUCMj84Sx2xTjHBvNsw@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] nss: CVE-2014-1568
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
X-List-Received-Date: Tue, 11 Nov 2014 01:50:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/08/2014 08:34 AM, Burton, Ross wrote:
> Hi Chong,
>
> On 6 November 2014 07:50, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     The following changes since commit
>     0add8abc12b850e38a6ec7dcf2856fab2c0107b6:
>
>       buildtools-tarball: package all of Python (2014-11-05 23:30:49
>     +0000)
>
>     are available in the git repository at:
>
>       git://git.pokylinux.org/poky-contrib
>     <http://git.pokylinux.org/poky-contrib> chonglu/nss
>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/nss
>
>     Chong Lu (1):
>       nss: CVE-2014-1568
>
>
> Sorry, but we've just merged Saul's upgrade of NSS to 3.17 so this 
> doesn't apply, and as we're unfrozen now an upgrade to the fixed 
> 3.17.1 seems like the sensible way forwards.  Could you do this upgrade?
>
> Ross

Hi Ross,

I've sent a patch to upgrade nss.

Best Regards
Chong

