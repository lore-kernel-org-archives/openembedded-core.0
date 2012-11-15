Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1TYzVj-0005zI-GV
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 14:29:39 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TYzIG-002Goe-R6>; Thu, 15 Nov 2012 14:15:44 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1TYzIG-000xTb-Lu>; Thu, 15 Nov 2012 14:15:44 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (internal_ws
	Exim 4.72) id 1TYzIF-0002ou-I0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 14:15:43 +0100
Date: Thu, 15 Nov 2012 14:15:43 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20121115131543.GA9465@mail.familie-heinold.de>
References: <50A4D31F.1050908@nedap.com>
MIME-Version: 1.0
In-Reply-To: <50A4D31F.1050908@nedap.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: llvm issue
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
X-List-Received-Date: Thu, 15 Nov 2012 13:29:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 15, 2012 at 12:33:51PM +0100, Jaap de Jong wrote:
> Hi All,
> 
> when I checkout openjdk-7 on meta-java and bitbake <anything> I get
> these errors:
> 
> ERROR: Unable to parse /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
> | ETA:  00:00:15
> ERROR: Command execution failed: Exited with 1
> NOTE: Error expanding variable populate_packages
> NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.8_2.8.bb
> NOTE: Error expanding variable populate_packages
> NOTE: Error during finalise of /data/jenkins/jobs/myTest/workspace/sources/meta-java/recipes-core/llvm/llvm2.9_2.9.bb
> 
> Anyone already know what is wrong here?
> 
> Cheers!
> Jaap

Hi Jaap,

please use oe-dev this is the wrong mailinglist.

Bye Henning


