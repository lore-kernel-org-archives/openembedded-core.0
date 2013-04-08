Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPFhF-0003ti-TQ
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 19:17:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Apr 2013 10:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; 
	d="scan'208,217";a="283206821"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Apr 2013 09:59:55 -0700
Message-ID: <5162F796.8020008@intel.com>
Date: Mon, 08 Apr 2013 20:00:06 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1365439656-29802-1-git-send-email-radu.moisan@intel.com>
	<1365440061.12407.49.camel@ted>
In-Reply-To: <1365440061.12407.49.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Upgrade to v1.0.1e
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
X-List-Received-Date: Mon, 08 Apr 2013 17:17:35 -0000
Content-Type: multipart/alternative;
	boundary="------------070603040704060201020405"

--------------070603040704060201020405
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/08/2013 07:54 PM, Richard Purdie wrote:
> On Mon, 2013-04-08 at 19:47 +0300, Radu Moisan wrote:
>> Dropped obolete patches and pulled updates for debian patches
> Isn't there some CVE this upgrade fixes which would be worth a mention
> in here?

With respect to what we had (1.0.0j) Scott pointed out the following

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2686
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0166
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0169

Yocto #3965  <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3965>


Radu

--------------070603040704060201020405
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix">On 04/08/2013 07:54 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:1365440061.12407.49.camel@ted" type="cite">
      <pre wrap="">On Mon, 2013-04-08 at 19:47 +0300, Radu Moisan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Dropped obolete patches and pulled updates for debian patches
</pre>
      </blockquote>
      <pre wrap="">
Isn't there some CVE this upgrade fixes which would be worth a mention
in here?
</pre>
    </blockquote>
    <br>
    With respect to what we had (1.0.0j) Scott pointed out the following<br>
    <br>
    <pre class="bz_comment_text" id="comment_text_0"><a href="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2686">http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2686</a>
<a href="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0166">http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0166</a>
<a href="http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0169">http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0169</a>

<a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=3965">Yocto #3965</a>
</pre>
    <br>
    Radu<br>
  </body>
</html>

--------------070603040704060201020405--
