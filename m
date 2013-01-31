Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U0tzd-0006r3-TR for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:15:54 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0VD4uXV029007; Thu, 31 Jan 2013 13:04:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id f5PJI1h6boOp; Thu, 31 Jan 2013 13:04:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0VD4n2D028855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 31 Jan 2013 13:04:52 GMT
Message-ID: <1359637195.14071.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <ming.liu@windriver.com>
Date: Thu, 31 Jan 2013 12:59:55 +0000
In-Reply-To: <1359625578-26968-1-git-send-email-ming.liu@windriver.com>
References: <1359625578-26968-1-git-send-email-ming.liu@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman-gnome: Add DEPENDS on intltool-native
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
X-List-Received-Date: Thu, 31 Jan 2013 13:15:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-01-31 at 17:46 +0800, Ming Liu wrote:
> [YOCTO #3815]
> [ CQID: WIND00401118 ]
> 
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This commit description isn't enough, please summarise bug 3815 in the
commit message.

Cheers,

Richard



