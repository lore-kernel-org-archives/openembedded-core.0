Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 738FD7730A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:45:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 25 Feb 2016 06:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; 
	d="scan'208,217";a="753142722"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by orsmga003.jf.intel.com with ESMTP; 25 Feb 2016 06:45:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<ae976c56455701eb7b7f0d9a95f80baaa388b705.1456327117.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZLmox=jXp9Js62qXYEm=H3PRtN8pDmYKri8_U75rijcg@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56CF13B0.4060704@linux.intel.com>
Date: Thu, 25 Feb 2016 08:46:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZLmox=jXp9Js62qXYEm=H3PRtN8pDmYKri8_U75rijcg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cve-check-tool patch to allow select dir for the db
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 14:45:34 -0000
Content-Type: multipart/alternative;
	boundary="------------030804040104050404000805"

--------------030804040104050404000805
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/25/2016 07:33 AM, Burton, Ross wrote:
>
> On 24 February 2016 at 15:27, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     This patch allows to select the directory for the
>     database used by cve-check-tool.
>
>
> Squash this into 1/3.
>
> Ross

This was the only patch that I made my own, that is why I sent it as 
separated patch. If you check the other patches there are co-authors in 
there. I don't want someone else take the blame if my patch bust 
something :)

Mariano

--------------030804040104050404000805
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 02/25/2016 07:33 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZLmox=jXp9Js62qXYEm=H3PRtN8pDmYKri8_U75rijcg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 February 2016 at 15:27, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:mariano.lopez@linux.intel.com"
                target="_blank">mariano.lopez@linux.intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":dv8" class="a3s" style="overflow:hidden">This
                patch allows to select the directory for the<br>
                database used by cve-check-tool.</div>
            </blockquote>
          </div>
          <br>
          Squash this into 1/3.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    This was the only patch that I made my own, that is why I sent it as
    separated patch. If you check the other patches there are co-authors
    in there. I don't want someone else take the blame if my patch bust
    something :)<br>
    <div class="moz-signature"><br>
      Mariano</div>
  </body>
</html>

--------------030804040104050404000805--
