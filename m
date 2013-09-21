Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B232960EDA
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 21 Sep 2013 12:08:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8LC83HO012739
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 21 Sep 2013 05:08:03 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sat, 21 Sep 2013 05:08:02 -0700
Message-ID: <523D8C22.7090107@windriver.com>
Date: Sat, 21 Sep 2013 07:08:02 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
	<1379697069.23351.110.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1379697069.23351.110.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v3 PATCH 0/9] Improved EFI boot support
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
X-List-Received-Date: Sat, 21 Sep 2013 12:08:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/20/2013 12:11 PM, Darren Hart wrote:
> So with these now upstream, I'm hitting the following after removing
> NO_ISO="1" from the MinnowBoard machine config. Is anything missing?
> Have you validated this is working for you after the merge?
> 


Only the first 2 patches in the series were actually merged, and the patches that provide the functionality you are looking for are not yet merged. 

Does that mean that I should post the remaining 7 patches again?  I don't know if it was the intent to only partially merge things or not.  Perhaps Saul is still doing some testing because 2 of the 9 patches (the 2 that were merged) came from his unified pull to Richard.

Cheers,
Jason. 

