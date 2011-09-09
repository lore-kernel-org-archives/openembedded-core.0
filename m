Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R25CR-0006LJ-D0 for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 19:49:11 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p89Ho3mE016524; Fri, 9 Sep 2011 18:50:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TUF7pzkdJaJD; Fri,  9 Sep 2011 18:50:02 +0100 (BST)
Received: from [192.168.1.43] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p89Hnulf016467
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 9 Sep 2011 18:49:58 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315557976.2519.88.camel@phil-desktop>
References: <1315427297.4368.4.camel@lenovo.internal.reciva.com>
	<4E683D5E.70103@linux.intel.com>
	<1315464889.4368.6.camel@lenovo.internal.reciva.com>
	<4E68E2EF.10402@intel.com>  <1315557976.2519.88.camel@phil-desktop>
Date: Fri, 09 Sep 2011 18:43:51 +0100
Message-ID: <1315590231.1986.8.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH] dbus: fix paths in startup script, use useradd.bbclass for user creation
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
X-List-Received-Date: Fri, 09 Sep 2011 17:49:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-09 at 09:46 +0100, Phil Blundell wrote:
> On Thu, 2011-09-08 at 08:44 -0700, Scott Garman wrote:
> > In any case, please submit your patch and I will advocate for its 
> > inclusion in our 1.1 release.
> 
> As requested.

[The shadow patch] merged to master, thanks.

Cheers,

Richard



