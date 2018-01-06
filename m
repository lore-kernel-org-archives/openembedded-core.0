Return-Path: <mac@mcrowe.com>
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 8EFEA788CE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 20:16:24 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id Xut8ekcIj2du7Xut9e7aUS; Sat, 06 Jan 2018 20:16:24 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=a6FAzQaF c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=RgaUWeydRksA:10 a=Q4-j1AaZAAAA:8
	a=78k4m6g3H3Zv34P6iF8A:9
	a=CjuIK1q_8ugA:10 a=N8Rd8igiEnUA:10 a=8387nF9mEzIA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eXut8-0000kv-7F; Sat, 06 Jan 2018 20:16:18 +0000
Date: Sat, 6 Jan 2018 20:16:18 +0000
From: Mike Crowe <mac@mcrowe.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180106201618.ktj64aparfs47yjv@mcrowe.com>
References: <20171112163923.19517-1-mac@mcrowe.com>
	<CAP9ODKoxmsvO6ZaSNkYX3_-R234vvFoq3Ce6cWKDg_RE2tvMtg@mail.gmail.com>
	<20171211095149.ywhejbets5loutnv@mcrowe.com>
	<CAJTo0Lbp+4hmDE69Wrc5z-EvwPytweozmxBWemrbTXhN5DHwRg@mail.gmail.com>
	<20171220102822.4ohufxtgcu3lg3r5@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20171220102822.4ohufxtgcu3lg3r5@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfFfB6rzN+dLgbcuCEHHPdpY53iiDTRprA0nfMPwSI447rgjkSZgo1L1mytkrPtTODdvEpRBjHjxy3t+BKQNHucqsuxUkDjhtaCCfSyg6kr/Cl0kmf0JY
	xX7/HSkY/LPltZgTRrTllRxsUMOTg+PpNKj452BNAYlH2wTzpZl+7q2M
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] cmake: Avoid passing empty prefix to os.path.relpath
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
X-List-Received-Date: Sat, 06 Jan 2018 20:16:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

https://patchwork.openembedded.org/patch/145709/

On Wednesday 20 December 2017 at 10:28:22 +0000, Mike Crowe wrote:
> On Monday 11 December 2017 at 13:45:26 +0000, Burton, Ross wrote:
> > It was implicated in some build failures.  I'll re-add it and try again.
> 
> Thanks. Are the new results in? I had a poke about on autobuilder.yocto.io
> but couldn't work out how to tell which builds this commit was included in.
> Build 719 did not appear to include it.

Any more news?

Thanks.

Mike.

