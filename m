Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SFKZi-0000F6-3S for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 09:24:14 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1SFKQp-0004jX-Ih for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 09:15:05 +0200
Received: from ABTS-KK-dynamic-040.33.172.122.airtelbroadband.in
	([ABTS-KK-dynamic-040.33.172.122.airtelbroadband.in])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 09:15:03 +0200
Received: from surendra.dhobalelinux by
	ABTS-KK-dynamic-040.33.172.122.airtelbroadband.in with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 09:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: surendra dhobale <surendra.dhobalelinux@gmail.com>
Date: Wed, 4 Apr 2012 06:34:39 +0000 (UTC)
Message-ID: <loom.20120404T082801-1@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 122.172.33.40 (Mozilla/5.0 (X11; Ubuntu; Linux i686;
	rv:11.0) Gecko/20100101 Firefox/11.0)
Subject: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 07:24:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
 I am working with the open embedded environment. 

I have added one u-boot package in that. First time by default the compilation
done successfully using the bitbake. But Now i made some changes in the source
code , which is created in the Temp work directory.

Now i have to built the same package with neglecting the fetch() stage. 
and rebuilt it means need to compilation.

Is any commands for that...
Can please anyone explain me in deatails about that. I am newbie in the open
embedded.


Surendra. 



