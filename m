Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mark.Asselstine@windriver.com>) id 1TE2Lx-0007o9-VV
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 20:16:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8II4G4t028391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Sep 2012 11:04:16 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 18 Sep 2012 11:04:15 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Scott Garman <scott.a.garman@intel.com>
Date: Tue, 18 Sep 2012 14:04:46 -0400
Message-ID: <2523126.yL5nmiLRhN@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.8.4 (Linux/3.2.0-27-generic; KDE/4.8.4; x86_64; ; )
In-Reply-To: <5058A3D2.5010106@intel.com>
References: <1347457260-25574-1-git-send-email-mark.asselstine@windriver.com>
	<32086337.ec4RMj2Chr@yow-masselst-d1> <5058A3D2.5010106@intel.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel: remove unused 'etc' directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 18:16:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On September 18, 2012 09:39:46 Scott Garman wrote:
> On 09/12/2012 12:35 PM, Mark Asselstine wrote:
> > On September 12, 2012 11:20:05 Saul Wold wrote:
> >> I assume this patch is for Denzil?  It seems that the current OE-Core
> >> master has etc in that list.
> >> 
> >> Please confirm
> >> 
> >> Sau!
> > 
> > Saul,
> > 
> > Sorry I got mixed up on my branches there and didn't notice your change,
> > thanks for straightening me out. Scott any chance we can get Saul's commit
> > 963742f5a9bc [kernel: Fix packaging issue] cherry-picked to Denzil?
> > 
> > Mark
> 
> Hi Mark,
> 
> Yes, I have just pulled that into my sgarman/denzil-next branches, to be
> queued up for Autobuilder testing ASAP.

Thanks Scott and Saul. Sorry for the initial confusion. I will be sure to look 
closer at the tree/branches next time around.

Mark

> 
> Scott
> 
> --
> Scott Garman
> Embedded Linux Engineer - Yocto Project
> Intel Open Source Technology Center


