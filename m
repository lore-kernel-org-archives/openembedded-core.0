Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SF13N-0004YF-1h
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 12:33:33 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SF0uX-00011F-56 for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 06:24:25 -0400
Date: Tue, 3 Apr 2012 06:24:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1204030619430.5778@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: is there a plan to briefly document all of the oe-core classes?
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
X-List-Received-Date: Tue, 03 Apr 2012 10:33:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  short followup on my (massively uninformed) post from yesterday --
is there any plan on documenting all of the oe-core classes, perhaps
even just a couple paragraphs?

  currently, the yocto reference manual has a classes reference
section:

http://www.yoctoproject.org/docs/latest/poky-ref-manual/poky-ref-manual.html#ref-classes

but it's obviously incomplete.  and in the docbook documentation for
that manual, the xml file even has a lengthy comment:

<!-- Undocumented classes are:
        allarch.bbclass
        binconfig.bbclass
        bootimg.bbclass
        buildstats.bbclass
        ccache.inc
        cmake.bbclass
        cml1.bbclass
        cross.bbclass
        cross-canadian.bbclass
	... etc etc ...

any plans to add explanations for those?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


