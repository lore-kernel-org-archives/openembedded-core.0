Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UPLJj-0001qP-Qq
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 01:17:39 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id C22932756B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2013 01:00:22 +0200 (CEST)
Message-ID: <51634C0A.5040300@pseudoterminal.org>
Date: Tue, 09 Apr 2013 01:00:26 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <5162038C.2020706@pseudoterminal.org>
In-Reply-To: <5162038C.2020706@pseudoterminal.org>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 23:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

thinking about this whole issue I began to wonder: why is gstreamer in 
oe-core and not in meta-multimedia?
wouldnt it be easier then to move liborc into meta-multimedia as well?
Or is gstreamer considered an essential component for many 
installations, thus justifying its presence in oe-core?

regards,
carlos


