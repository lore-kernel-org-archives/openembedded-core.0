Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1Q5J9g-0007LV-IS for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:47:25 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id B2DC51C01F91;
	Thu, 31 Mar 2011 16:45:24 +0200 (CEST)
X-Auth-Info: sOG3szHZxJMNpxFnxQQtjeK12G9zvBefsty6tvrkO+w=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id A6A841C00095;
	Thu, 31 Mar 2011 16:45:24 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 91EE8329A66F;
	Thu, 31 Mar 2011 16:45:24 +0200 (CEST)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 151DBF03208;
	Thu, 31 Mar 2011 16:45:24 +0200 (CEST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <AANLkTikSYNW=0rdzvaNnq9LO8agu0Vz67b_Fi-pNJmyx@mail.gmail.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
	<41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
	<20110331141920.3B1C5F03208@gemini.denx.de>
	<AANLkTikSYNW=0rdzvaNnq9LO8agu0Vz67b_Fi-pNJmyx@mail.gmail.com>
Comments: In-reply-to Bruce Ashfield <bruce.ashfield@gmail.com>
	message dated "Thu, 31 Mar 2011 10:23:31 -0400."
Date: Thu, 31 Mar 2011 16:45:24 +0200
Message-Id: <20110331144524.151DBF03208@gemini.denx.de>
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
X-List-Received-Date: Thu, 31 Mar 2011 14:47:25 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit

Dear Bruce Ashfield,

In message <AANLkTikSYNW=0rdzvaNnq9LO8agu0Vz67b_Fi-pNJmyx@mail.gmail.com> you wrote:
>
> There were a couple of build errors using u-boot master and
> some specific branch tags, errors that we didn't see when using
> some older toolchains. But the reports are not confirmed/formalized
> yet. When we know more, the plan is to definitely address them and
> hopefully do better than a bug report .. produce a patch.

If there are issues, please Cc: the U-Boot mailing list.


Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Reader, suppose you were an idiot. And suppose you were a  member  of
Congress. But I repeat myself.                           - Mark Twain


