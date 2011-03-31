Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1Q5PUe-0006bW-LV for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 23:33:28 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 85A031C0F567;
	Thu, 31 Mar 2011 23:31:28 +0200 (CEST)
X-Auth-Info: DQEqxIe6UN1p+OEtgZzYvd9O8sCoLrNqh800xVm0X2s=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 251381C00086;
	Thu, 31 Mar 2011 23:31:28 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 01EC9329A66F;
	Thu, 31 Mar 2011 23:31:27 +0200 (CEST)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 70E96F03208;
	Thu, 31 Mar 2011 23:31:27 +0200 (CEST)
To: Darren Hart <dvhart@linux.intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <4D94ACBA.90409@linux.intel.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
	<41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
	<20110331141920.3B1C5F03208@gemini.denx.de>
	<4D94ACBA.90409@linux.intel.com>
Comments: In-reply-to Darren Hart <dvhart@linux.intel.com>
	message dated "Thu, 31 Mar 2011 09:32:58 -0700."
Date: Thu, 31 Mar 2011 23:31:27 +0200
Message-Id: <20110331213127.70E96F03208@gemini.denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] README.hardware: remove u-boot flashing instructions for mpc8315e-rdb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 21:33:28 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit

Dear Darren Hart,

In message <4D94ACBA.90409@linux.intel.com> you wrote:
> 
> Absolutely, this wasn't intended as a final "solution". The issue 
> appears to be related to the 4.5.1 version of gcc failing in various 
> ways to build either u-boot master or v2010.09, or v2010.12. I will 
> report this to the u-boot mailing list just as soon as I can get back to it.

Why did you not enter this as a bug in bugzilla, then?

Will we have a Yocto 1.0 releasse soon, with such known bugs?

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
A conservative is a man who believes that nothing should be done for
the first time.                                   - Alfred E. Wiggam


