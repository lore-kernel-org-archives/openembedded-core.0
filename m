Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TX9KG-0001MT-70
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Nov 2012 12:34:12 +0100
Received: from [192.168.0.2] (host81-153-118-218.range81-153.btcentralplus.com
	[81.153.118.218]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 287E39BE3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Nov 2012 11:20:24 +0000 (GMT)
Message-ID: <509E3877.50606@r-finger.com>
Date: Sat, 10 Nov 2012 11:20:23 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1352455397.git.ross.burton@intel.com>
	<154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
	<CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
	<1352501827.9083.21.camel@ted>
	<CAP9ODKpa0gkf5ZQGVemLYRNKVKA4cWbV4v1E_SZwAs9RuMd61A@mail.gmail.com>
	<1352545898.6869.103.camel@x121e.pbcl.net>
In-Reply-To: <1352545898.6869.103.camel@x121e.pbcl.net>
Subject: Re: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Sat, 10 Nov 2012 11:34:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/12 11:11, Phil Blundell wrote:
> The whole PR-bumping thing is just a massive pain in the backside and,
> now that all the metadata is hashed into the signature files anyway, I
> think we should consider just ditching PR from oe-core altogether.

+1

Tomas


