Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rbb6s-0004Da-2w for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:58:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGpCtK020329
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:51:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20203-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:51:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGp3Ts020323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 16:51:04 GMT
Message-ID: <1324054264.4568.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 16:51:04 +0000
In-Reply-To: <568afc1a01d9a6674e5109abce6dd5996b6c59e9.1324053729.git.elizabeth.flanagan@intel.com>
References: <cover.1324053729.git.elizabeth.flanagan@intel.com>
	<568afc1a01d9a6674e5109abce6dd5996b6c59e9.1324053729.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] license.bbclass: remove bashism
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
X-List-Received-Date: Fri, 16 Dec 2011 16:58:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-16 at 08:44 -0800, Beth Flanagan wrote:
> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> 
> Removing a bashism that was dumping errors into rootfs log.
> 
> Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
> ---
>  meta/classes/license.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



