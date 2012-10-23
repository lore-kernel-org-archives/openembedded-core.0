Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQejg-0008N3-SE
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:41:37 +0200
Received: from localhost ([127.0.0.1]:41285 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQeWg-0000cX-OP
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 13:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=6RdvHERz/tx6DiYruAi9fb
	QgM98=; b=LgpmSMZZQ1AEjhLqD7QBmiZH6a/doo20UQvJn9V8xKH1s8H3X3GMEK
	KsBl/IFmADs+F2RdUeN1kAfVGOFVpqinEaEIkqZ1veeg1SCoOwcLxvY06UN6Zgb0
	EkbZ/oXyHfWfOnuOS4KyZ3N/uS7kQHAuIqMZ/ScFKm6HvKwW+DFj4=
Received: from [195.171.99.130] (port=54718 helo=[192.168.0.67])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TQeWg-0000cU-MP
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 13:28:10 +0000
Message-ID: <50869BDC.6050401@communistcode.co.uk>
Date: Tue, 23 Oct 2012 14:30:04 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Issues building meta-toolchain, libxau
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 13:41:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm struggling to build a varient of meta-toolchain as I keep running 
into the following error. I can't see any recent changes to libxau soI'm 
a bit stumped...

http://ix.io/3dL

Regards,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



