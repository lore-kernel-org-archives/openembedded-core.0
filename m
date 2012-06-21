Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ShfI3-0007fI-TC for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:11:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB0Nkf021698
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21414-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LB0DgX021692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:00:14 +0100
Message-ID: <1340276415.1640.91.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 12:00:15 +0100
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] denzil pull request 3
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
X-List-Received-Date: Thu, 21 Jun 2012 11:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-06-18 at 12:57 -0700, Scott Garman wrote:
> Gary Thomas (1):
>   webkit-gtk: Apply work around for all PowerPC targets
> 
> Laurentiu Palcu (1):
>   sanity.bbclass: warn the user if BBPATH contains wrong entries
> 
> Nitin A Kamble (1):
>   eglibc: package mtrace separately
> 
> Richard Purdie (1):
>   openjade-native: Ensure we reautoconf the package
> 
> Saul Wold (2):
>   quilt: added ac_cv_path_BASH to CACHED_CONFIGUREVARS
>   eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS

Merged to master apart from the sanity.bbclass change for the reasons in
a separate email.

Cheers,

Richard



