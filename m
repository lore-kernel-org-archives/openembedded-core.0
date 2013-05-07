Received: from elasmtp-kukur.atl.sa.earthlink.net ([209.86.89.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jshanab@earthlink.net>) id 1UZXlR-0000PP-Qq
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 04:36:26 +0200
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=dk20050327; d=earthlink.net;
	b=G8BShIw/uGix+XBpaT0lwu8upkJEkHQQ8zCmETkcpchsBkgx4EB/WZOQ7X6BuCkS;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding:X-ELNK-Trace:X-Originating-IP;
Received: from [173.15.37.68] (helo=[192.168.1.201])
	by elasmtp-kukur.atl.sa.earthlink.net with esmtpsa
	(TLSv1:AES256-SHA:256) (Exim 4.67)
	(envelope-from <jshanab@earthlink.net>) id 1UZXRM-0001TV-NR
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 22:15:40 -0400
Message-ID: <518863CB.4080001@earthlink.net>
Date: Mon, 06 May 2013 21:15:39 -0500
From: Jeff Shanab <jshanab@earthlink.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130210 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-ELNK-Trace: 41b7b48e67ad7886d780f4a490ca6956d5d4673fe7faad865788c298c2a24389bf41be97c8c0d249350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 173.15.37.68
Subject: Hob interface
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
X-List-Received-Date: Tue, 07 May 2013 02:36:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I pulled day before yesturday and I am trying to start with a base image and add
stuff to make a custom build. But I cannot save, there is no template
button.
Does it now edit the files in the current conf dir?
I liked the concept of being able to start with a know image, save it
out as a named template then edit, save(before I spend hours building)
then build and test.



